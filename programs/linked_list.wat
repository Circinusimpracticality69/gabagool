(module $linked_list.wasm
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
  (export "linked_list_bench" (func $linked_list_bench))
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
  (func $linked_list_bench (;1;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 65536
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 0
    local.set 1
    i32.const 0
    local.set 2
    loop ;; label = @1
      local.get 0
      local.get 1
      i32.add
      local.tee 3
      local.get 2
      i32.store
      local.get 3
      i32.const 28
      i32.add
      local.get 2
      i32.const 7
      i32.add
      i32.store
      local.get 3
      i32.const 24
      i32.add
      local.get 2
      i32.const 6
      i32.add
      i32.store
      local.get 3
      i32.const 20
      i32.add
      local.get 2
      i32.const 5
      i32.add
      i32.store
      local.get 3
      i32.const 16
      i32.add
      local.get 2
      i32.const 4
      i32.add
      i32.store
      local.get 3
      i32.const 12
      i32.add
      local.get 2
      i32.const 3
      i32.add
      i32.store
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      i32.const 2
      i32.add
      i32.store
      local.get 3
      i32.const 4
      i32.add
      local.get 2
      i32.const 1
      i32.add
      i32.store
      local.get 1
      i32.const 32
      i32.add
      local.set 1
      local.get 2
      i32.const 8
      i32.add
      local.tee 2
      i32.const 16384
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 0
    i32.const 65532
    i32.add
    local.set 2
    i32.const 54321
    local.set 1
    i32.const 16384
    local.set 3
    loop ;; label = @1
      local.get 2
      i32.load
      local.set 4
      local.get 2
      local.get 0
      local.get 1
      i32.const 1103515245
      i32.mul
      i32.const 12345
      i32.add
      local.tee 1
      i32.const 16
      i32.shr_u
      local.get 3
      i32.rem_u
      i32.const 2
      i32.shl
      i32.add
      local.tee 5
      i32.load
      i32.store
      local.get 5
      local.get 4
      i32.store
      local.get 2
      i32.const -4
      i32.add
      local.set 2
      local.get 3
      i32.const -1
      i32.add
      local.tee 3
      i32.const 1
      i32.gt_u
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 2
    local.get 0
    i32.load
    local.tee 6
    local.set 3
    loop ;; label = @1
      local.get 3
      i32.const 3
      i32.shl
      local.tee 5
      i32.const 1024
      i32.add
      local.get 0
      local.get 2
      i32.add
      local.tee 1
      i32.const 4
      i32.add
      i32.load
      local.tee 4
      i32.store
      local.get 5
      i32.const 1028
      i32.add
      local.get 3
      i32.store
      local.get 4
      i32.const 3
      i32.shl
      local.tee 3
      i32.const 1024
      i32.add
      local.get 1
      i32.const 8
      i32.add
      i32.load
      local.tee 5
      i32.store
      local.get 3
      i32.const 1028
      i32.add
      local.get 4
      i32.store
      local.get 5
      i32.const 3
      i32.shl
      local.tee 4
      i32.const 1024
      i32.add
      local.get 1
      i32.const 12
      i32.add
      i32.load
      local.tee 3
      i32.store
      local.get 4
      i32.const 1028
      i32.add
      local.get 5
      i32.store
      local.get 2
      i32.const 12
      i32.add
      local.tee 2
      i32.const 65532
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 0
    i32.load offset=65532
    local.tee 2
    i32.const 3
    i32.shl
    local.tee 3
    i32.const 1028
    i32.add
    local.get 2
    i32.store
    local.get 3
    i32.const 1024
    i32.add
    i32.const -1
    i32.store
    i32.const 0
    local.set 1
    i32.const 0
    local.set 2
    loop ;; label = @1
      local.get 6
      local.set 3
      block ;; label = @2
        local.get 6
        i32.const 0
        i32.lt_s
        local.tee 4
        br_if 0 (;@2;)
        loop ;; label = @3
          local.get 3
          i32.const 3
          i32.shl
          local.tee 3
          i32.load offset=1028
          local.get 2
          i32.add
          local.set 2
          local.get 3
          i32.load offset=1024
          local.tee 3
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
        end
      end
      block ;; label = @2
        local.get 4
        br_if 0 (;@2;)
        local.get 6
        local.set 3
        loop ;; label = @3
          local.get 3
          i32.const 3
          i32.shl
          local.tee 3
          i32.load offset=1028
          local.get 2
          i32.add
          local.set 2
          local.get 3
          i32.load offset=1024
          local.tee 3
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
        end
      end
      local.get 1
      i32.const 2
      i32.add
      local.tee 1
      i32.const 200
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 0
    i32.const 65536
    i32.add
    global.set $__stack_pointer
    local.get 2
  )
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
