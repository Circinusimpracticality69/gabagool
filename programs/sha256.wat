(module $sha256.wasm
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (type (;2;) (func (param i32 i32)))
  (memory (;0;) 2)
  (global $__stack_pointer (;0;) (mut i32) i32.const 66848)
  (global (;1;) i32 i32.const 1024)
  (global (;2;) i32 i32.const 1312)
  (global (;3;) i32 i32.const 1312)
  (global (;4;) i32 i32.const 66848)
  (global (;5;) i32 i32.const 1024)
  (global (;6;) i32 i32.const 66848)
  (global (;7;) i32 i32.const 131072)
  (global (;8;) i32 i32.const 0)
  (global (;9;) i32 i32.const 1)
  (global (;10;) i32 i32.const 65536)
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "sha256_bench" (func $sha256_bench))
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
  (func $sha256_bench (;1;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64)
    global.get $__stack_pointer
    i32.const 1120
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 42
    local.set 1
    i32.const 0
    local.set 2
    loop ;; label = @1
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const 3
      i32.add
      local.get 1
      i32.const -301564143
      i32.mul
      i32.const -698016724
      i32.add
      local.tee 4
      i32.const 16
      i32.shr_u
      i32.store8
      local.get 3
      i32.const 2
      i32.add
      local.get 1
      i32.const -2139243339
      i32.mul
      i32.const -1492899873
      i32.add
      i32.const 16
      i32.shr_u
      i32.store8
      local.get 3
      i32.const 1
      i32.add
      local.get 1
      i32.const -1029531031
      i32.mul
      i32.const -740551042
      i32.add
      i32.const 16
      i32.shr_u
      i32.store8
      local.get 3
      local.get 1
      i32.const 1103515245
      i32.mul
      i32.const 12345
      i32.add
      i32.const 16
      i32.shr_u
      i32.store8
      local.get 4
      local.set 1
      local.get 2
      i32.const 4
      i32.add
      local.tee 2
      i32.const 1024
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 0
    i32.const 1024
    i32.add
    i32.const 1
    i32.or
    local.set 1
    local.get 0
    i32.const 960
    i32.add
    local.set 4
    local.get 0
    i32.const 896
    i32.add
    local.set 5
    local.get 0
    i32.const 832
    i32.add
    local.set 6
    local.get 0
    i32.const 768
    i32.add
    local.set 7
    local.get 0
    i32.const 704
    i32.add
    local.set 8
    local.get 0
    i32.const 640
    i32.add
    local.set 9
    local.get 0
    i32.const 576
    i32.add
    local.set 10
    local.get 0
    i32.const 512
    i32.add
    local.set 11
    local.get 0
    i32.const 448
    i32.add
    local.set 12
    local.get 0
    i32.const 384
    i32.add
    local.set 13
    local.get 0
    i32.const 320
    i32.add
    local.set 14
    local.get 0
    i32.const 256
    i32.add
    local.set 15
    local.get 0
    i32.const 192
    i32.add
    local.set 16
    local.get 0
    i32.const 128
    i32.add
    local.set 17
    local.get 0
    i32.const 64
    i32.add
    local.set 18
    i32.const 1000
    local.set 3
    i32.const 0
    i64.load offset=1048
    local.set 19
    i32.const 0
    i64.load offset=1040
    local.set 20
    i32.const 0
    i64.load offset=1032
    local.set 21
    i32.const 0
    i64.load offset=1024
    local.set 22
    loop ;; label = @1
      local.get 0
      local.get 19
      i64.store offset=1112
      local.get 0
      local.get 20
      i64.store offset=1104
      local.get 0
      local.get 21
      i64.store offset=1096
      local.get 0
      local.get 22
      i64.store offset=1088
      local.get 0
      i32.const 1088
      i32.add
      local.get 0
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 18
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 17
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 16
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 15
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 14
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 13
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 12
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 11
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 10
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 9
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 8
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 7
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 6
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 5
      call $sha256_block
      local.get 0
      i32.const 1088
      i32.add
      local.get 4
      call $sha256_block
      local.get 1
      i64.const 0
      i64.store align=1
      local.get 1
      i64.const 0
      i64.store offset=8 align=1
      local.get 1
      i64.const 0
      i64.store offset=16 align=1
      local.get 1
      i64.const 0
      i64.store offset=24 align=1
      local.get 1
      i64.const 0
      i64.store offset=32 align=1
      local.get 1
      i64.const 0
      i64.store offset=40 align=1
      local.get 1
      i64.const 0
      i64.store offset=48 align=1
      local.get 1
      i64.const 0
      i64.store offset=53 align=1
      local.get 0
      i32.const 128
      i32.store8 offset=1024
      local.get 0
      i32.const 32
      i32.store16 offset=1086
      local.get 0
      i32.const 1088
      i32.add
      local.get 0
      i32.const 1024
      i32.add
      call $sha256_block
      local.get 0
      local.get 0
      i32.load offset=1088
      local.tee 2
      i32.const 16711935
      i32.and
      i32.const 8
      i32.rotr
      local.get 2
      i32.const 24
      i32.rotr
      i32.const 16711935
      i32.and
      i32.or
      i32.store
      local.get 3
      i32.const -1
      i32.add
      local.tee 3
      br_if 0 (;@1;)
    end
    local.get 0
    i32.const 1120
    i32.add
    global.set $__stack_pointer
    local.get 2
  )
  (func $sha256_block (;2;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 256
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 0
    local.set 3
    loop ;; label = @1
      local.get 2
      local.get 3
      i32.add
      local.get 1
      local.get 3
      i32.add
      i32.load align=1
      local.tee 4
      i32.const 16711935
      i32.and
      i32.const 8
      i32.rotr
      local.get 4
      i32.const 24
      i32.rotr
      i32.const 16711935
      i32.and
      i32.or
      i32.store
      local.get 3
      i32.const 4
      i32.add
      local.tee 3
      i32.const 64
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 4
    loop ;; label = @1
      local.get 2
      local.get 4
      i32.add
      local.tee 3
      i32.const 64
      i32.add
      local.get 3
      i32.const 56
      i32.add
      i32.load
      local.tee 1
      i32.const 15
      i32.rotl
      local.get 1
      i32.const 13
      i32.rotl
      i32.xor
      local.get 1
      i32.const 10
      i32.shr_u
      i32.xor
      local.get 3
      i32.const 36
      i32.add
      i32.load
      i32.add
      local.get 3
      i32.load
      i32.add
      local.get 3
      i32.const 4
      i32.add
      i32.load
      local.tee 3
      i32.const 25
      i32.rotl
      local.get 3
      i32.const 14
      i32.rotl
      i32.xor
      local.get 3
      i32.const 3
      i32.shr_u
      i32.xor
      i32.add
      i32.store
      local.get 4
      i32.const 4
      i32.add
      local.tee 4
      i32.const 192
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 1
    local.get 0
    i32.load
    local.tee 5
    local.set 6
    local.get 0
    i32.load offset=28
    local.tee 7
    local.set 8
    local.get 0
    i32.load offset=24
    local.tee 9
    local.set 10
    local.get 0
    i32.load offset=20
    local.tee 11
    local.set 12
    local.get 0
    i32.load offset=16
    local.tee 13
    local.set 14
    local.get 0
    i32.load offset=12
    local.tee 15
    local.set 16
    local.get 0
    i32.load offset=8
    local.tee 17
    local.set 18
    local.get 0
    i32.load offset=4
    local.tee 19
    local.set 4
    loop ;; label = @1
      local.get 4
      local.set 20
      local.get 6
      local.tee 4
      i32.const 30
      i32.rotl
      local.get 4
      i32.const 19
      i32.rotl
      i32.xor
      local.get 4
      i32.const 10
      i32.rotl
      i32.xor
      local.get 4
      local.get 20
      local.get 18
      local.tee 21
      i32.xor
      i32.and
      local.get 21
      local.get 20
      i32.and
      i32.xor
      i32.add
      local.get 14
      local.tee 3
      i32.const 26
      i32.rotl
      local.get 3
      i32.const 21
      i32.rotl
      i32.xor
      local.get 3
      i32.const 7
      i32.rotl
      i32.xor
      local.get 12
      local.tee 22
      local.get 3
      i32.and
      i32.add
      local.get 8
      i32.add
      local.get 10
      local.tee 23
      local.get 3
      i32.const -1
      i32.xor
      i32.and
      i32.add
      local.get 1
      i32.const 1056
      i32.add
      i32.load
      i32.add
      local.get 2
      local.get 1
      i32.add
      i32.load
      i32.add
      local.tee 14
      i32.add
      local.set 6
      local.get 14
      local.get 16
      i32.add
      local.set 14
      local.get 23
      local.set 8
      local.get 22
      local.set 10
      local.get 3
      local.set 12
      local.get 21
      local.set 16
      local.get 20
      local.set 18
      local.get 1
      i32.const 4
      i32.add
      local.tee 1
      i32.const 256
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 0
    local.get 23
    local.get 7
    i32.add
    i32.store offset=28
    local.get 0
    local.get 22
    local.get 9
    i32.add
    i32.store offset=24
    local.get 0
    local.get 3
    local.get 11
    i32.add
    i32.store offset=20
    local.get 0
    local.get 14
    local.get 13
    i32.add
    i32.store offset=16
    local.get 0
    local.get 21
    local.get 15
    i32.add
    i32.store offset=12
    local.get 0
    local.get 20
    local.get 17
    i32.add
    i32.store offset=8
    local.get 0
    local.get 4
    local.get 19
    i32.add
    i32.store offset=4
    local.get 0
    local.get 6
    local.get 5
    i32.add
    i32.store
    local.get 2
    i32.const 256
    i32.add
    global.set $__stack_pointer
  )
  (data $.rodata (;0;) (i32.const 1024) "g\e6\09j\85\aeg\bbr\f3n<:\f5O\a5\7fR\0eQ\8ch\05\9b\ab\d9\83\1f\19\cd\e0[\98/\8aB\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f1\9b\c1\c1i\9b\e4\86G\be\ef\c6\9d\c1\0f\cc\a1\0c$o,\e9-\aa\84tJ\dc\a9\b0\5c\da\88\f9vRQ>\98m\c61\a8\c8'\03\b0\c7\7fY\bf\f3\0b\e0\c6G\91\a7\d5Qc\ca\06g))\14\85\0a\b7'8!\1b.\fcm,M\13\0d8STs\0ae\bb\0ajv.\c9\c2\81\85,r\92\a1\e8\bf\a2Kf\1a\a8p\8bK\c2\a3Ql\c7\19\e8\92\d1$\06\99\d6\855\0e\f4p\a0j\10\16\c1\a4\19\08l7\1eLwH'\b5\bc\b04\b3\0c\1c9J\aa\d8NO\ca\9c[\f3o.h\ee\82\8ftoc\a5x\14x\c8\84\08\02\c7\8c\fa\ff\be\90\eblP\a4\f7\a3\f9\be\f2xq\c6")
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after data) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
