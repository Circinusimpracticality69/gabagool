(module $call_chain.wasm
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (type (;2;) (func (param i32) (result i32)))
  (memory (;0;) 2)
  (global $__stack_pointer (;0;) (mut i32) i32.const 66560)
  (global (;1;) i32 i32.const 1024)
  (global (;2;) i32 i32.const 1024)
  (global (;3;) i32 i32.const 1024)
  (global (;4;) i32 i32.const 66560)
  (global (;5;) i32 i32.const 1024)
  (global (;6;) i32 i32.const 66560)
  (global (;7;) i32 i32.const 131072)
  (global (;8;) i32 i32.const 0)
  (global (;9;) i32 i32.const 1)
  (global (;10;) i32 i32.const 65536)
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "call_chain_bench" (func $call_chain_bench))
  (export "__dso_handle" (global 1))
  (export "__data_end" (global 2))
  (export "__stack_low" (global 3))
  (export "__stack_high" (global 4))
  (export "__global_base" (global 5))
  (export "__heap_base" (global 6))
  (export "__heap_end" (global 7))
  (export "__memory_base" (global 8))
  (export "__table_base" (global 9))
  (export "__wasm_first_page_end" (global 10))
  (func $__wasm_call_ctors (;0;) (type 0))
  (func $call_chain_bench (;1;) (type 1) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 0
    i32.const 0
    local.set 1
    loop ;; label = @1
      local.get 0
      call $f19
      local.get 1
      i32.add
      local.set 1
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      i32.const 100000
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 1
  )
  (func $f19 (;2;) (type 2) (param i32) (result i32)
    local.get 0
    call $f18
    i32.const 1
    i32.add
  )
  (func $f18 (;3;) (type 2) (param i32) (result i32)
    local.get 0
    call $f17
    i32.const 1
    i32.add
  )
  (func $f17 (;4;) (type 2) (param i32) (result i32)
    local.get 0
    call $f16
    i32.const 1
    i32.add
  )
  (func $f16 (;5;) (type 2) (param i32) (result i32)
    local.get 0
    call $f15
    i32.const 1
    i32.add
  )
  (func $f15 (;6;) (type 2) (param i32) (result i32)
    local.get 0
    call $f14
    i32.const 1
    i32.add
  )
  (func $f14 (;7;) (type 2) (param i32) (result i32)
    local.get 0
    call $f13
    i32.const 1
    i32.add
  )
  (func $f13 (;8;) (type 2) (param i32) (result i32)
    local.get 0
    call $f12
    i32.const 1
    i32.add
  )
  (func $f12 (;9;) (type 2) (param i32) (result i32)
    local.get 0
    call $f11
    i32.const 1
    i32.add
  )
  (func $f11 (;10;) (type 2) (param i32) (result i32)
    local.get 0
    call $f10
    i32.const 1
    i32.add
  )
  (func $f10 (;11;) (type 2) (param i32) (result i32)
    local.get 0
    call $f9
    i32.const 1
    i32.add
  )
  (func $f9 (;12;) (type 2) (param i32) (result i32)
    local.get 0
    call $f8
    i32.const 1
    i32.add
  )
  (func $f8 (;13;) (type 2) (param i32) (result i32)
    local.get 0
    call $f7
    i32.const 1
    i32.add
  )
  (func $f7 (;14;) (type 2) (param i32) (result i32)
    local.get 0
    call $f6
    i32.const 1
    i32.add
  )
  (func $f6 (;15;) (type 2) (param i32) (result i32)
    local.get 0
    call $f5
    i32.const 1
    i32.add
  )
  (func $f5 (;16;) (type 2) (param i32) (result i32)
    local.get 0
    call $f4
    i32.const 1
    i32.add
  )
  (func $f4 (;17;) (type 2) (param i32) (result i32)
    local.get 0
    call $f3
    i32.const 1
    i32.add
  )
  (func $f3 (;18;) (type 2) (param i32) (result i32)
    local.get 0
    call $f2
    i32.const 1
    i32.add
  )
  (func $f2 (;19;) (type 2) (param i32) (result i32)
    local.get 0
    call $f1
    i32.const 1
    i32.add
  )
  (func $f1 (;20;) (type 2) (param i32) (result i32)
    local.get 0
    call $f0
    i32.const 1
    i32.add
  )
  (func $f0 (;21;) (type 2) (param i32) (result i32)
    local.get 0
    i32.const 1
    i32.add
  )
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
