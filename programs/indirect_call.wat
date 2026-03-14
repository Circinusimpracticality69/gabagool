(module $indirect_call.wasm
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func))
  (type (;2;) (func (result i32)))
  (table (;0;) 11 11 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (;0;) (mut i32) i32.const 66608)
  (global (;1;) i32 i32.const 1024)
  (global (;2;) i32 i32.const 1064)
  (global (;3;) i32 i32.const 1072)
  (global (;4;) i32 i32.const 66608)
  (global (;5;) i32 i32.const 1024)
  (global (;6;) i32 i32.const 66608)
  (global (;7;) i32 i32.const 131072)
  (global (;8;) i32 i32.const 0)
  (global (;9;) i32 i32.const 1)
  (global (;10;) i32 i32.const 65536)
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "indirect_call_bench" (func $indirect_call_bench))
  (export "__indirect_function_table" (table 0))
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
  (elem (;0;) (i32.const 1) func $op_add $op_sub $op_mul $op_and $op_or $op_xor $op_shl $op_shr $op_min $op_max)
  (func $__wasm_call_ctors (;0;) (type 1))
  (func $indirect_call_bench (;1;) (type 2) (result i32)
    (local i32 i32 i32)
    i32.const 305419896
    local.set 0
    i32.const 1000000
    local.set 1
    i32.const 1
    local.set 2
    loop ;; label = @1
      local.get 2
      local.get 0
      i32.const 1103515245
      i32.mul
      i32.const 12345
      i32.add
      local.tee 0
      i32.const 255
      i32.and
      i32.const 1
      i32.add
      local.get 0
      i32.const 16
      i32.shr_u
      i32.const 10
      i32.rem_u
      i32.const 2
      i32.shl
      i32.load offset=1024
      call_indirect (type 0)
      local.tee 2
      i32.const 1
      local.get 2
      i32.const 1
      i32.gt_u
      select
      local.set 2
      local.get 1
      i32.const -1
      i32.add
      local.tee 1
      br_if 0 (;@1;)
    end
    local.get 2
  )
  (func $op_add (;2;) (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.add
  )
  (func $op_sub (;3;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.sub
  )
  (func $op_mul (;4;) (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.mul
  )
  (func $op_and (;5;) (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.and
  )
  (func $op_or (;6;) (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.or
  )
  (func $op_xor (;7;) (type 0) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.xor
  )
  (func $op_shl (;8;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.shl
  )
  (func $op_shr (;9;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.shr_s
  )
  (func $op_min (;10;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 0
    local.get 1
    i32.lt_s
    select
  )
  (func $op_max (;11;) (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 0
    local.get 1
    i32.gt_s
    select
  )
  (data $.rodata (;0;) (i32.const 1024) "\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00\0a\00\00\00")
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after data) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
