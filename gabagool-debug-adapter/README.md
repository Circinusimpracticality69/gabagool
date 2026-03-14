# gabagool-debug-adapter

A DAP server that enables time travel debugging for WebAssembly programs

Currently, the debugger steps through .wat source files. Suporting DWARF debug symbols to step through the original source code is a future (and lofty) goal.

# Usage

```sh
# build the debug adapter
cargo b -p gabagool-debug-adapter
# symlink the extension into vscode
ln -sfn "$(pwd)/gabagool-debug-adapter" ~/.vscode/extensions/gabagool-debug

# reload vscode (cmd + shift + p -> "Developer: reload window)
# go to fibonacci.wat and press F5
# note the launch config in .vscode/launch.json controls which `.wasm` program
# function and arguments to debug
```

# Reading

https://microsoft.github.io/debug-adapter-protocol/specification.html<br>
