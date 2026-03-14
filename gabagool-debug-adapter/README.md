# gabagool-debug-adapter

A DAP server that enables time travel debugging for WebAssembly programs

Currently, the debugger steps through .wat source files. Suporting DWARF debug symbols to step through the original source code is a future (and lofty) goal.

# Usage

```sh
# build the debug adapter and copy binary into extension dir
cargo build -p gabagool-debug-adapter
mkdir -p gabagool-debug-adapter/bin
cp target/debug/gabagool-debug-adapter gabagool-debug-adapter/bin/

# symlink the extension into vscode
ln -sfn "$(pwd)/gabagool-debug-adapter" ~/.vscode/extensions/gabagool-debug

# reload vscode (cmd + shift + p -> "Developer: reload window")
# open any .wat file and press F5, then pick a program from the dropdown
```

# Reading

https://microsoft.github.io/debug-adapter-protocol/specification.html<br>
