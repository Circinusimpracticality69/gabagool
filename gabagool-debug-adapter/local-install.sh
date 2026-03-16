#!/bin/bash
set -e

cd "$(dirname "$0")/.."

for wat in programs/*.wat; do
    wasm="${wat%.wat}.wasm"
    if wat2wasm "$wat" -o "$wasm" 2>/dev/null; then
        echo "  compiled $wat"
    fi
done

cargo build -p gabagool-debug-adapter

mkdir -p gabagool-debug-adapter/bin
cp target/debug/gabagool-debug-adapter gabagool-debug-adapter/bin/

echo "done — reload VS Code window"
