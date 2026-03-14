(module $mandelbrot.wasm
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
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
  (export "mandelbrot_bench" (func $mandelbrot_bench))
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
  (func $mandelbrot_bench (;1;) (type 1) (result i32)
    (local f64 i32 i32 f64 f64 f64 i32 i32 f64 f64 f64 f64 i32 i32)
    f64.const 0x0p+0 (;=0;)
    local.set 0
    i32.const 0
    local.set 1
    i32.const 0
    local.set 2
    loop ;; label = @1
      local.get 0
      f64.const 0x1p-7 (;=0.0078125;)
      f64.mul
      local.tee 3
      local.get 3
      f64.add
      f64.const -0x1p+0 (;=-1;)
      f64.add
      local.set 4
      f64.const 0x0p+0 (;=0;)
      local.set 5
      i32.const 0
      local.set 6
      loop ;; label = @2
        local.get 1
        local.set 7
        local.get 5
        f64.const 0x1p-7 (;=0.0078125;)
        f64.mul
        f64.const 0x1.cp+1 (;=3.5;)
        f64.mul
        f64.const -0x1.4p+1 (;=-2.5;)
        f64.add
        local.set 8
        i32.const 0
        local.set 1
        f64.const 0x0p+0 (;=0;)
        local.set 9
        f64.const 0x0p+0 (;=0;)
        local.set 10
        f64.const 0x0p+0 (;=0;)
        local.set 3
        block ;; label = @3
          loop ;; label = @4
            local.get 3
            local.get 3
            f64.add
            local.set 11
            local.get 1
            i32.const 1
            i32.add
            local.set 12
            local.get 8
            local.get 3
            local.get 3
            f64.mul
            local.get 9
            f64.sub
            f64.add
            local.tee 3
            local.get 3
            f64.mul
            local.get 11
            local.get 10
            f64.mul
            local.get 4
            f64.add
            local.tee 10
            local.get 10
            f64.mul
            local.tee 9
            f64.add
            f64.const 0x1p+2 (;=4;)
            f64.le
            i32.eqz
            br_if 1 (;@3;)
            local.get 1
            i32.const 99
            i32.lt_u
            local.set 13
            local.get 9
            local.set 9
            local.get 12
            local.set 1
            local.get 13
            br_if 0 (;@4;)
          end
        end
        local.get 5
        f64.const 0x1p+0 (;=1;)
        f64.add
        local.set 5
        local.get 7
        local.get 12
        i32.add
        local.set 1
        local.get 6
        i32.const 1
        i32.add
        local.tee 6
        i32.const 128
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 7
      local.get 12
      i32.add
      local.set 1
      local.get 0
      f64.const 0x1p+0 (;=1;)
      f64.add
      local.set 0
      local.get 2
      i32.const 1
      i32.add
      local.tee 2
      i32.const 128
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 7
    local.get 12
    i32.add
  )
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
