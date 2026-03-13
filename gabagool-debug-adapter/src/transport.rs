use serde_json::Value;
use std::io::{self, BufRead, BufReader, BufWriter, Read, Stdin, Stdout, Write};

pub struct Transport {
    reader: BufReader<Stdin>,
    writer: BufWriter<Stdout>,
}

impl Transport {
    pub fn stdio() -> Self {
        Self {
            reader: BufReader::new(io::stdin()),
            writer: BufWriter::new(io::stdout()),
        }
    }

    pub fn read_message(&mut self) -> io::Result<Option<Value>> {
        let mut content_length = None;
        let mut header_line = String::new();

        loop {
            header_line.clear();
            let bytes_read = self.reader.read_line(&mut header_line)?;
            if bytes_read == 0 {
                return Ok(None);
            }

            let trimmed = header_line.trim();
            if trimmed.is_empty() {
                break;
            }

            if let Some(val) = trimmed.strip_prefix("Content-Length: ") {
                content_length = val.parse().ok();
            }
        }

        let length = content_length.ok_or_else(|| {
            io::Error::new(io::ErrorKind::InvalidData, "missing content length header")
        })?;

        let mut body = vec![0u8; length];
        self.reader.read_exact(&mut body)?;

        let msg = serde_json::from_slice(&body)
            .map_err(|e| io::Error::new(io::ErrorKind::InvalidData, e))?;

        Ok(Some(msg))
    }

    pub fn write_message(&mut self, msg: &Value) -> io::Result<()> {
        let body = serde_json::to_string(msg)?;
        write!(
            self.writer,
            "Content-Length: {}\r\n\r\n{}",
            body.len(),
            body
        )?;
        self.writer.flush()
    }
}
