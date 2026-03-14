use crate::transport::Transport;
use gabagool::debugger::{Debugger, StepResult};
use gabagool::{Module, RawValue, Store};
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
}

impl DAPServer {
    pub const fn new(transport: Transport) -> Self {
        Self {
            transport,
            seq: 0,
            debugger: None,
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
                "next" | "stepIn" => self.handle_step_forward(request_seq, command)?,
                "stepBack" => self.handle_step_back(request_seq)?,
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

        match Self::create_debugger(program, function, call_args) {
            Ok(debugger) => {
                self.debugger = Some(debugger);
                self.send_response(request_seq, "launch", json!({}))?;
                self.send_event("initialized", json!({}))
            }
            Err(e) => self.send_error_response(request_seq, "launch", &e.to_string()),
        }
    }

    fn create_debugger(program: &str, function: &str, args: Vec<RawValue>) -> Result<Debugger> {
        let wasm = fs::read(program)?;
        let module = Module::new(&wasm).map_err(err)?;
        let mut store = Store::new();
        let instance = store.instantiate(&module, vec![]).map_err(err)?;

        // note: we just use the default config, we parsed the module and the store
        // wonder if we can come up with a heuristic based on how "large" the module
        // is...
        let mut debugger = Debugger::new(store, instance);
        debugger.start(function, args).map_err(err)?;

        Ok(debugger)
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
                json!({
                    "id": i,
                    "name": format!("func_{}", frame.compiled_func_idx),
                    "line": 0,
                    "column": 0,
                    "source": {
                        "name": format!("module_{}", frame.module_idx),
                        "sourceReference": 0,
                    },
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
