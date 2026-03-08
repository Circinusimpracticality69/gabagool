# gabagool

A WebAssembly interpreter written from scratch.

This project aims to build a fully spec-compliant, performant interpreter whose entire execution state can be serialized, suspended, and restored.
<br>

<details open>
<summary>See demo</summary>
<br>
<img src="demo.gif" width="80%" alt="Game of Life demo"><br>
<em>Each fork snapshots the entire WebAssembly execution state, spawns a brand new process, and resumes exactly where it left off.</em>

<br>
</details>

# Status

`gabagool` is not optimized and no serious profiling/benchmarking has been done. That said, the goal is to make it as performant as a pure interpreter can be. The most interesting direction is a translation phase that lowers WASM instructions into a compact intermediate representation, designed for efficient dispatch and serialization.

`gabagool` is tested against the [WebAssembly spec test suite](https://github.com/WebAssembly/spec/tree/main/test/core). **1,899 tests pass out of 2,049 (93%).** `gabagool` passes on arithmetic, control flow, memory, tables, globals, function references, imports/exports, and exceptions. Remaining tests involve supporting SIMD and garbage collection.

```sh
# run the test suite
uv run download-spec-tests.py
cargo t --features spec-tests

# run an example wasm program
cargo r -- stair_climb.wasm stair_climb 20
```

# Reading

https://webassembly.github.io/spec/core/<br>
https://github.com/bytecodealliance/wasmtime/issues/3017<br>
https://github.com/bytecodealliance/wasmtime/issues/4002<br>

https://www.infoq.com/podcasts/web-assembly-component-model/<br>
https://blog.sunfishcode.online/what-is-a-wasm-component/<br>
https://www.fermyon.com/blog/webassembly-component-model
