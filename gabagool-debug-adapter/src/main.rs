#![warn(clippy::nursery)]

mod base64;
mod server;
mod source_map;
mod transport;

use server::DAPServer;
use transport::Transport;

fn main() {
    let transport = Transport::stdio();
    let mut server = DAPServer::new(transport);

    if let Err(e) = server.run() {
        eprintln!("DAP server error: {e}");
        std::process::exit(1);
    }
}
