use crate::transport::Transport;
use serde_json::{json, Value};
use std::io;

pub struct DAPServer {
    transport: Transport,
    seq: i64,
}

impl DAPServer {
    pub fn new(transport: Transport) -> Self {
        Self { transport, seq: 0 }
    }

    pub fn run(&mut self) -> io::Result<()> {
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
                "disconnect" => {
                    self.send_response(request_seq, command, json!({}))?;
                    break;
                }
                _ => {
                    self.send_response(request_seq, command, json!({}))?;
                }
            }
        }

        Ok(())
    }

    fn send_response(&mut self, request_seq: i64, command: &str, body: Value) -> io::Result<()> {
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
}
