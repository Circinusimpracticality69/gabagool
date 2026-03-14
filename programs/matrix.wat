(module $matrix.wasm
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (memory (;0;) 2)
  (global $__stack_pointer (;0;) (mut i32) i32.const 115712)
  (global (;1;) i32 i32.const 1024)
  (global (;2;) i32 i32.const 50176)
  (global (;3;) i32 i32.const 50176)
  (global (;4;) i32 i32.const 115712)
  (global (;5;) i32 i32.const 1024)
  (global (;6;) i32 i32.const 115712)
  (global (;7;) i32 i32.const 131072)
  (global (;8;) i32 i32.const 0)
  (global (;9;) i32 i32.const 1)
  (global (;10;) i32 i32.const 65536)
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "matrix_init" (func $matrix_init))
  (export "matrix_multiply" (func $matrix_multiply))
  (export "matrix_checksum" (func $matrix_checksum))
  (export "matrix_bench" (func $matrix_bench))
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
  (func $matrix_init (;1;) (type 0)
    (local i32 i32 i32)
    i32.const 0
    local.set 0
    i32.const 33792
    i32.const 0
    i32.const 16384
    memory.fill
    i32.const 0
    local.set 1
    i32.const 0
    local.set 2
    loop ;; label = @1
      local.get 0
      i32.const 17408
      i32.add
      local.get 1
      i32.const 101
      i32.rem_u
      i32.store
      local.get 0
      i32.const 1024
      i32.add
      local.get 2
      i32.const 65535
      i32.and
      i32.const 97
      i32.rem_u
      i32.store
      local.get 0
      i32.const 4
      i32.add
      local.set 0
      local.get 1
      i32.const 31
      i32.add
      local.set 1
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      i32.const 4096
      i32.ne
      br_if 0 (;@1;)
    end
  )
  (func $matrix_multiply (;2;) (type 0)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    local.set 0
    i32.const 1024
    local.set 1
    loop ;; label = @1
      local.get 0
      i32.const 8
      i32.shl
      i32.const 33792
      i32.add
      local.set 2
      i32.const 17408
      local.set 3
      i32.const 0
      local.set 4
      loop ;; label = @2
        i32.const 0
        local.set 5
        local.get 3
        local.set 6
        i32.const 0
        local.set 7
        loop ;; label = @3
          local.get 6
          i32.const 256
          i32.add
          i32.load
          local.get 1
          local.get 5
          i32.add
          local.tee 8
          i32.const 4
          i32.add
          i32.load
          i32.mul
          local.get 6
          i32.load
          local.get 8
          i32.load
          i32.mul
          local.get 7
          i32.add
          i32.add
          local.set 7
          local.get 6
          i32.const 512
          i32.add
          local.set 6
          local.get 5
          i32.const 8
          i32.add
          local.tee 5
          i32.const 256
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 4
        i32.const 2
        i32.shl
        i32.add
        local.get 7
        i32.store
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        local.get 4
        i32.const 1
        i32.add
        local.tee 4
        i32.const 64
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const 256
      i32.add
      local.set 1
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      i32.const 64
      i32.ne
      br_if 0 (;@1;)
    end
  )
  (func $matrix_checksum (;3;) (type 1) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 0
    i32.const -16384
    local.set 1
    loop ;; label = @1
      local.get 1
      i32.const 50188
      i32.add
      i32.load
      local.get 1
      i32.const 50184
      i32.add
      i32.load
      local.get 1
      i32.const 50180
      i32.add
      i32.load
      local.get 1
      i32.const 50176
      i32.add
      i32.load
      local.get 0
      i32.add
      i32.add
      i32.add
      i32.add
      local.set 0
      local.get 1
      i32.const 16
      i32.add
      local.tee 1
      br_if 0 (;@1;)
    end
    local.get 0
  )
  (func $matrix_bench (;4;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    local.set 0
    i32.const 33792
    i32.const 0
    i32.const 16384
    memory.fill
    i32.const 0
    local.set 1
    i32.const 0
    local.set 2
    loop ;; label = @1
      local.get 1
      i32.const 17408
      i32.add
      local.get 0
      i32.const 101
      i32.rem_u
      i32.store
      local.get 1
      i32.const 1024
      i32.add
      local.get 2
      i32.const 65535
      i32.and
      i32.const 97
      i32.rem_u
      i32.store
      local.get 0
      i32.const 31
      i32.add
      local.set 0
      local.get 1
      i32.const 4
      i32.add
      local.set 1
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      i32.const 4096
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 3
    i32.const 1024
    local.set 4
    loop ;; label = @1
      local.get 3
      i32.const 8
      i32.shl
      i32.const 33792
      i32.add
      local.set 5
      i32.const 17408
      local.set 6
      i32.const 0
      local.set 7
      loop ;; label = @2
        i32.const 0
        local.set 0
        local.get 6
        local.set 1
        i32.const 0
        local.set 2
        loop ;; label = @3
          local.get 1
          i32.const 256
          i32.add
          i32.load
          local.get 4
          local.get 0
          i32.add
          local.tee 8
          i32.const 4
          i32.add
          i32.load
          i32.mul
          local.get 1
          i32.load
          local.get 8
          i32.load
          i32.mul
          local.get 2
          i32.add
          i32.add
          local.set 2
          local.get 1
          i32.const 512
          i32.add
          local.set 1
          local.get 0
          i32.const 8
          i32.add
          local.tee 0
          i32.const 256
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 5
        local.get 7
        i32.const 2
        i32.shl
        i32.add
        local.get 2
        i32.store
        local.get 6
        i32.const 4
        i32.add
        local.set 6
        local.get 7
        i32.const 1
        i32.add
        local.tee 7
        i32.const 64
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 4
      i32.const 256
      i32.add
      local.set 4
      local.get 3
      i32.const 1
      i32.add
      local.tee 3
      i32.const 64
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 0
    i32.const -16384
    local.set 1
    loop ;; label = @1
      local.get 1
      i32.const 50188
      i32.add
      i32.load
      local.get 1
      i32.const 50184
      i32.add
      i32.load
      local.get 1
      i32.const 50180
      i32.add
      i32.load
      local.get 1
      i32.const 50176
      i32.add
      i32.load
      local.get 0
      i32.add
      i32.add
      i32.add
      i32.add
      local.set 0
      local.get 1
      i32.const 16
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
