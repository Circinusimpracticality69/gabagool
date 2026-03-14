(module $ackermann.wasm
  (type (;0;) (func))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (result i32)))
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
  (export "ackermann" (func $ackermann))
  (export "ackermann_bench" (func $ackermann_bench))
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
  (func $ackermann (;1;) (type 1) (param i32 i32) (result i32)
    block ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      loop ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            i32.const 1
            local.set 1
            br 1 (;@3;)
          end
          local.get 0
          local.get 1
          i32.const -1
          i32.add
          call $ackermann
          local.set 1
        end
        local.get 0
        i32.const -1
        i32.add
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 1
    i32.add
  )
  (func $ackermann_bench (;2;) (type 2) (result i32)
    i32.const 3
    i32.const 5
    call $ackermann
  )
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
