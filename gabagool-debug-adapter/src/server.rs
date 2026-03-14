use crate::source_map::WatSourceMap;
use crate::transport::Transport;
use gabagool::debugger::{Debugger, StepResult};
use gabagool::{Module, RawValue, Store, ValueType};
use serde_json::{json, Value};
use std::fs;
use std::io::{Error, Result};

fn err(e: impl std::fmt::Display) -> Error {
    Error::other(e.to_string())
}

pub struct DAPServer {
    transport: Transport,
    seq: i64,
    debugger: Option<Debugger>,
    source_map: Option<WatSourceMap>,
    // offset for local func index.
    num_imported_funcs: u32,
}

impl DAPServer {
    pub const fn new(transport: Transport) -> Self {
        Self {
            transport,
            seq: 0,
            debugger: None,
            source_map: None,
            num_imported_funcs: 0,
        }
    }

    pub fn run(&mut self) -> Result<()> {
        while let Some(msg) = self.transport.read_message()? {
            let command = msg["command"].as_str().unwrap_or("");
            let request_seq = msg["seq"].as_i64().unwrap_or(0);

            match command {
                "initialize" => {
                    let body = json!({
                        "supportsStepBack": true,
                        "supportsConfigurationDoneRequest": true,
                    });
                    self.send_response(request_seq, command, body)?;
                }
                "launch" => self.handle_launch(request_seq, &msg)?,
                "configurationDone" => self.handle_configuration_done(request_seq)?,
                "threads" => self.handle_threads(request_seq)?,
                "stackTrace" => self.handle_stack_trace(request_seq)?,
                "scopes" => self.handle_scopes(request_seq, &msg)?,
                "variables" => self.handle_variables(request_seq, &msg)?,
                "next" | "stepIn" => self.handle_step_forward(request_seq, command)?,
                "stepBack" => self.handle_step_back(request_seq)?,
                "continue" => self.handle_continue(request_seq)?,
                "reverseContinue" => self.handle_reverse_continue(request_seq)?,
                "disconnect" => {
                    self.send_response(request_seq, "disconnect", json!({}))?;
                    break;
                }
                _ => {
                    self.send_response(request_seq, command, json!({}))?;
                }
            }
        }

        Ok(())
    }

    fn debugger(&self) -> Result<&Debugger> {
        self.debugger
            .as_ref()
            .ok_or_else(|| err("debugger not initialized"))
    }

    fn debugger_mut(&mut self) -> Result<&mut Debugger> {
        self.debugger
            .as_mut()
            .ok_or_else(|| err("debugger not initialized"))
    }

    fn handle_launch(&mut self, request_seq: i64, msg: &Value) -> Result<()> {
        let args = &msg["arguments"];
        let program = args["program"].as_str().unwrap_or("");
        let function = args["function"].as_str().unwrap_or("main");

        let call_args = args["args"]
            .as_array()
            .map(|arr| {
                arr.iter()
                    .filter_map(|v| v.as_i64().map(|n| RawValue::from(n as i32)))
                    .collect()
            })
            .unwrap_or_default();

        let source_path = args["source"]
            .as_str()
            .map(String::from)
            .unwrap_or_else(|| program.replace(".wasm", ".wat"));

        let wat_source = fs::read_to_string(&source_path)?;
        self.source_map = Some(WatSourceMap::from_wat(&source_path, &wat_source));

        match Self::create_debugger(program, function, call_args) {
            Ok((debugger, num_imported_funcs)) => {
                self.debugger = Some(debugger);
                self.num_imported_funcs = num_imported_funcs;
                self.send_response(request_seq, "launch", json!({}))?;
                self.send_event("initialized", json!({}))
            }
            Err(e) => self.send_error_response(request_seq, "launch", &e.to_string()),
        }
    }

    fn create_debugger(
        program: &str,
        function: &str,
        args: Vec<RawValue>,
    ) -> Result<(Debugger, u32)> {
        let wasm = fs::read(program)?;
        let module = Module::new(&wasm).map_err(err)?;
        let num_imported_funcs = module
            .import_declarations()
            .iter()
            .filter(|imp| matches!(imp.description, gabagool::ImportDescription::Func(_)))
            .count() as u32;
        let mut store = Store::new();
        let instance = store.instantiate(&module, vec![]).map_err(err)?;
        let mut debugger = Debugger::new(store, instance);
        debugger.start(function, args).map_err(err)?;

        Ok((debugger, num_imported_funcs))
    }

    fn handle_configuration_done(&mut self, request_seq: i64) -> Result<()> {
        self.send_response(request_seq, "configurationDone", json!({}))?;
        self.send_event(
            "stopped",
            json!({
                "reason": "entry",
                "threadId": 1,
            }),
        )?;
        Ok(())
    }

    fn handle_threads(&mut self, request_seq: i64) -> Result<()> {
        self.send_response(
            request_seq,
            "threads",
            // because it's single threaded
            json!({
                "threads": [{"id": 1, "name": "wasm"}]
            }),
        )
    }

    fn handle_stack_trace(&mut self, request_seq: i64) -> Result<()> {
        let mut frames = self
            .debugger()?
            .call_stack()
            .enumerate()
            .map(|(i, frame)| {
                let local_func_idx = frame
                    .compiled_func_idx
                    .saturating_sub(self.num_imported_funcs)
                    as usize;

                let (name, line, source) = if let Some(sm) = &self.source_map {
                    let name = sm
                        .func_name(local_func_idx)
                        .unwrap_or(&format!("func_{}", frame.compiled_func_idx))
                        .to_string();
                    let line = sm
                        .instruction_to_line(local_func_idx, frame.source_position)
                        .unwrap_or(0);
                    let source = json!({
                        "name": std::path::Path::new(&sm.path)
                            .file_name()
                            .and_then(|f| f.to_str())
                            .unwrap_or(&sm.path),
                        "path": sm.path,
                    });
                    (name, line, source)
                } else {
                    unreachable!("source map should exist by now")
                };

                json!({
                    "id": i,
                    "name": name,
                    "line": line,
                    "column": 0,
                    "source": source,
                })
            })
            .collect::<Vec<_>>();

        frames.reverse();

        self.send_response(
            request_seq,
            "stackTrace",
            json!({
                "stackFrames": frames,
                "totalFrames": frames.len(),
            }),
        )
    }

    fn handle_scopes(&mut self, request_seq: i64, msg: &Value) -> Result<()> {
        let frame_id = msg["arguments"]["frameId"].as_i64().unwrap_or(0);
        self.send_response(
            request_seq,
            "scopes",
            json!({
                "scopes": [
                    { "name": "Locals", "variablesReference": frame_id + 1, "expensive": false },
                ]
            }),
        )
    }

    fn handle_variables(&mut self, request_seq: i64, msg: &Value) -> Result<()> {
        let var_ref = msg["arguments"]["variablesReference"].as_i64().unwrap_or(0);
        let frame_id = var_ref as usize - 1;

        let dbg = self.debugger()?;
        let frames = dbg.call_stack().collect::<Vec<_>>();

        if frames.is_empty() {
            return self.send_response(request_seq, "variables", json!({ "variables": [] }));
        }

        let frame_idx = frames.len().saturating_sub(1).saturating_sub(frame_id);

        // find the right frame, then we resolve the locals and display names
        let frame = &frames[frame_idx];
        let local_func_idx = frame
            .compiled_func_idx
            .saturating_sub(self.num_imported_funcs) as usize;

        let vars = frame
            .locals
            .iter()
            .zip(frame.local_types.iter())
            .enumerate()
            .map(|(i, (val, ty))| {
                let default_name = format!("local_{i}");
                let name = self
                    .source_map
                    .as_ref()
                    .and_then(|sm| sm.local_name(local_func_idx, i))
                    .unwrap_or(&default_name)
                    .to_string();

                json!({
                    "name": name,
                    "value": format_value(val, ty),
                    "type": format!("{ty:?}"),
                    "variablesReference": 0,
                })
            })
            .collect::<Vec<_>>();

        self.send_response(request_seq, "variables", json!({ "variables": vars }))
    }

    fn handle_step_forward(&mut self, request_seq: i64, command: &str) -> Result<()> {
        let result = self.debugger_mut()?.step_forward().map_err(err)?;
        self.send_response(request_seq, command, json!({}))?;
        self.send_step_event(result)
    }

    fn handle_step_back(&mut self, request_seq: i64) -> Result<()> {
        let result = self.debugger_mut()?.step_back().map_err(err)?;
        self.send_response(request_seq, "stepBack", json!({}))?;
        self.send_step_event(result)
    }

    fn handle_continue(&mut self, request_seq: i64) -> Result<()> {
        let result = self.debugger_mut()?.continue_forward().map_err(err)?;
        self.send_response(request_seq, "continue", json!({}))?;
        self.send_step_event(result)
    }

    fn handle_reverse_continue(&mut self, request_seq: i64) -> Result<()> {
        let result = self.debugger_mut()?.continue_backward().map_err(err)?;
        self.send_response(request_seq, "reverseContinue", json!({}))?;
        self.send_step_event(result)
    }

    fn send_step_event(&mut self, result: StepResult) -> Result<()> {
        match result {
            StepResult::Stepped | StepResult::ReachedStart => {
                self.send_event("stopped", json!({"reason": "step", "threadId": 1}))
            }
            StepResult::BreakpointHit => {
                self.send_event("stopped", json!({"reason": "breakpoint", "threadId": 1}))
            }
            StepResult::Completed => self.send_event("terminated", json!({})),
            StepResult::Trap(trap) => self.send_event(
                "stopped",
                json!({"reason": "exception", "threadId": 1, "text": trap.to_string()}),
            ),
        }
    }

    fn send_response(&mut self, request_seq: i64, command: &str, body: Value) -> Result<()> {
        self.seq += 1;
        self.transport.write_message(&json!({
            "seq": self.seq,
            "type": "response",
            "request_seq": request_seq,
            "success": true,
            "command": command,
            "body": body,
        }))
    }

    fn send_error_response(
        &mut self,
        request_seq: i64,
        command: &str,
        message: &str,
    ) -> Result<()> {
        self.seq += 1;
        self.transport.write_message(&json!({
            "seq": self.seq,
            "type": "response",
            "request_seq": request_seq,
            "success": false,
            "command": command,
            "message": message,
        }))
    }

    fn send_event(&mut self, event: &str, body: Value) -> Result<()> {
        self.seq += 1;
        self.transport.write_message(&json!({
            "seq": self.seq,
            "type": "event",
            "event": event,
            "body": body,
        }))
    }
}

fn format_value(val: &RawValue, ty: &ValueType) -> String {
    match ty {
        ValueType::I32 => val.as_i32().to_string(),
        ValueType::I64 => val.as_i64().to_string(),
        ValueType::F32 => val.as_f32().to_string(),
        ValueType::F64 => val.as_f64().to_string(),
        _ => format!("{val:?}"),
    }
}
