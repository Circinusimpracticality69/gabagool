(module $bulk_memory.wasm
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (memory (;0;) 4)
  (global $__stack_pointer (;0;) (mut i32) i32.const 197632)
  (global (;1;) i32 i32.const 1024)
  (global (;2;) i32 i32.const 132096)
  (global (;3;) i32 i32.const 132096)
  (global (;4;) i32 i32.const 197632)
  (global (;5;) i32 i32.const 1024)
  (global (;6;) i32 i32.const 197632)
  (global (;7;) i32 i32.const 262144)
  (global (;8;) i32 i32.const 0)
  (global (;9;) i32 i32.const 1)
  (global (;10;) i32 i32.const 65536)
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "bulk_memory_bench" (func $bulk_memory_bench))
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
  (func $bulk_memory_bench (;1;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    i32.const 77777
    local.set 0
    i32.const -65536
    local.set 1
    loop ;; label = @1
      local.get 1
      i32.const 66563
      i32.add
      local.get 0
      i32.const -301564143
      i32.mul
      i32.const -698016724
      i32.add
      local.tee 2
      i32.const 16
      i32.shr_u
      i32.store8
      local.get 1
      i32.const 66562
      i32.add
      local.get 0
      i32.const -2139243339
      i32.mul
      i32.const -1492899873
      i32.add
      i32.const 16
      i32.shr_u
      i32.store8
      local.get 1
      i32.const 66561
      i32.add
      local.get 0
      i32.const -1029531031
      i32.mul
      i32.const -740551042
      i32.add
      i32.const 16
      i32.shr_u
      i32.store8
      local.get 1
      i32.const 66560
      i32.add
      local.get 0
      i32.const 1103515245
      i32.mul
      i32.const 12345
      i32.add
      i32.const 16
      i32.shr_u
      i32.store8
      local.get 2
      local.set 0
      local.get 1
      i32.const 4
      i32.add
      local.tee 1
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 3
    loop ;; label = @1
      i32.const 66560
      i32.const 1024
      i32.const 65536
      memory.copy
      i32.const 0
      i32.load8_u offset=66560
      local.tee 4
      local.set 0
      i32.const 0
      local.set 1
      loop ;; label = @2
        local.get 1
        i32.const 1024
        i32.add
        local.get 1
        i32.const 66561
        i32.add
        i32.load8_u
        local.tee 2
        local.get 0
        i32.xor
        i32.store8
        local.get 1
        i32.const 1025
        i32.add
        local.get 2
        local.get 1
        i32.const 66562
        i32.add
        i32.load8_u
        local.tee 5
        i32.xor
        i32.store8
        local.get 1
        i32.const 1026
        i32.add
        local.get 5
        local.get 1
        i32.const 66563
        i32.add
        i32.load8_u
        local.tee 0
        i32.xor
        i32.store8
        local.get 1
        i32.const 3
        i32.add
        local.tee 1
        i32.const 65535
        i32.ne
        br_if 0 (;@2;)
      end
      i32.const 0
      local.get 4
      i32.const 0
      i32.load8_u offset=132095
      i32.xor
      i32.store8 offset=66559
      local.get 3
      i32.const 1
      i32.add
      local.tee 3
      i32.const 500
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 0
    i32.const -65536
    local.set 1
    loop ;; label = @1
      local.get 0
      local.get 1
      i32.const 132096
      i32.add
      i32.load8_u
      i32.add
      local.get 1
      i32.const 132097
      i32.add
      i32.load8_u
      i32.add
      local.get 1
      i32.const 132098
      i32.add
      i32.load8_u
      i32.add
      local.get 1
      i32.const 132099
      i32.add
      i32.load8_u
      i32.add
      local.set 0
      local.get 1
      i32.const 4
      i32.add
      local.tee 1
      br_if 0 (;@1;)
    end
    local.get 0
  )
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
