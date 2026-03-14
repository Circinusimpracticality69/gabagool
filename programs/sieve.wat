(module $sieve.wasm
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (memory (;0;) 3)
  (global $__stack_pointer (;0;) (mut i32) i32.const 166560)
  (global (;1;) i32 i32.const 1024)
  (global (;2;) i32 i32.const 101024)
  (global (;3;) i32 i32.const 101024)
  (global (;4;) i32 i32.const 166560)
  (global (;5;) i32 i32.const 1024)
  (global (;6;) i32 i32.const 166560)
  (global (;7;) i32 i32.const 196608)
  (global (;8;) i32 i32.const 0)
  (global (;9;) i32 i32.const 1)
  (global (;10;) i32 i32.const 65536)
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "count_primes" (func $count_primes))
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
  (func $count_primes (;1;) (type 1) (result i32)
    (local i32 i32)
    i32.const 1024
    i32.const 1
    i32.const 100000
    memory.fill
    i32.const 0
    i32.const 0
    i32.store16 offset=1024
    i32.const 2
    local.set 0
    i32.const 4
    local.set 1
    loop ;; label = @1
      block ;; label = @2
        local.get 0
        i32.load8_u offset=1024
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 99999
        i32.gt_u
        br_if 0 (;@2;)
        loop ;; label = @3
          local.get 1
          i32.const 1024
          i32.add
          i32.const 0
          i32.store8
          local.get 1
          local.get 0
          i32.add
          local.tee 1
          i32.const 100000
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      local.get 0
      i32.mul
      local.set 1
      local.get 0
      i32.const 317
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 0
    i32.const -100000
    local.set 1
    loop ;; label = @1
      local.get 0
      local.get 1
      i32.const 101024
      i32.add
      i32.load8_u
      i32.add
      local.get 1
      i32.const 101025
      i32.add
      i32.load8_u
      i32.add
      local.get 1
      i32.const 101026
      i32.add
      i32.load8_u
      i32.add
      local.get 1
      i32.const 101027
      i32.add
      i32.load8_u
      i32.add
      local.get 1
      i32.const 101028
      i32.add
      i32.load8_u
      i32.add
      local.set 0
      local.get 1
      i32.const 5
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
