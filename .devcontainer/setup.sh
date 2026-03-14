#!/bin/bash
set -e

cargo install wasm-tools --locked 2>/dev/null || true
for f in programs/*.wasm; do
    wat="${f%.wasm}.wat"
    [ -f "$wat" ] || wasm-tools print "$f" > "$wat"
done
wasm-tools parse programs/demo.wat -o programs/demo.wasm

cargo build -p gabagool-debug-adapter

mkdir -p gabagool-debug-adapter/bin
cp target/debug/gabagool-debug-adapter gabagool-debug-adapter/bin/

npm install -g @vscode/vsce
cd gabagool-debug-adapter
echo y | vsce package --allow-missing-repository -o gabagool-debug.vsix
cd ..
