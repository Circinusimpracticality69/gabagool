(module $binary_search.wasm
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (memory (;0;) 6)
  (global $__stack_pointer (;0;) (mut i32) i32.const 328704)
  (global (;1;) i32 i32.const 1024)
  (global (;2;) i32 i32.const 263168)
  (global (;3;) i32 i32.const 263168)
  (global (;4;) i32 i32.const 328704)
  (global (;5;) i32 i32.const 1024)
  (global (;6;) i32 i32.const 328704)
  (global (;7;) i32 i32.const 393216)
  (global (;8;) i32 i32.const 0)
  (global (;9;) i32 i32.const 1)
  (global (;10;) i32 i32.const 65536)
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "binary_search_bench" (func $binary_search_bench))
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
  (func $binary_search_bench (;1;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 10
    local.set 0
    i32.const 1024
    local.set 1
    loop ;; label = @1
      local.get 1
      i32.const 12
      i32.add
      local.get 0
      i32.store
      local.get 1
      i32.const 8
      i32.add
      local.get 0
      i32.const -4
      i32.add
      i32.store
      local.get 1
      i32.const 4
      i32.add
      local.get 0
      i32.const -6
      i32.add
      i32.store
      local.get 1
      local.get 0
      i32.const -10
      i32.add
      i32.store
      local.get 1
      i32.const 16
      i32.add
      local.set 1
      local.get 0
      i32.const 12
      i32.add
      local.tee 0
      i32.const 196618
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 98765
    local.set 2
    i32.const 0
    local.set 3
    i32.const 0
    local.set 4
    loop ;; label = @1
      local.get 2
      i32.const 1103515245
      i32.mul
      i32.const 12345
      i32.add
      local.tee 2
      i32.const 16
      i32.shr_u
      local.set 5
      i32.const 65535
      local.set 1
      i32.const 0
      local.set 0
      block ;; label = @2
        block ;; label = @3
          loop ;; label = @4
            local.get 1
            local.get 0
            i32.sub
            i32.const 1
            i32.shr_u
            local.get 0
            i32.add
            local.tee 6
            i32.const 2
            i32.shl
            i32.load offset=1024
            local.tee 7
            local.get 5
            i32.eq
            br_if 1 (;@3;)
            local.get 6
            i32.const 1
            i32.add
            local.get 0
            local.get 7
            local.get 5
            i32.lt_s
            local.tee 7
            select
            local.tee 0
            local.get 1
            local.get 6
            i32.const -1
            i32.add
            local.get 7
            select
            local.tee 1
            i32.le_s
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 4
        i32.const 1
        i32.add
        local.set 4
      end
      local.get 3
      i32.const 1
      i32.add
      local.tee 3
      i32.const 100000
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 4
  )
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
