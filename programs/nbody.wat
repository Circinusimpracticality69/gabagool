(module $nbody.wasm
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (type (;2;) (func (param f64) (result f64)))
  (memory (;0;) 2)
  (global $__stack_pointer (;0;) (mut i32) i32.const 66896)
  (global (;1;) i32 i32.const 1024)
  (global (;2;) i32 i32.const 1352)
  (global (;3;) i32 i32.const 1360)
  (global (;4;) i32 i32.const 66896)
  (global (;5;) i32 i32.const 1024)
  (global (;6;) i32 i32.const 66896)
  (global (;7;) i32 i32.const 131072)
  (global (;8;) i32 i32.const 0)
  (global (;9;) i32 i32.const 1)
  (global (;10;) i32 i32.const 65536)
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "nbody_bench" (func $nbody_bench))
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
  (func $nbody_bench (;1;) (type 1) (result i32)
    (local f64 f64 f64 f64 f64 f64 f64 f64 f64 f64 f64 f64 f64 i32 f64 f64 i32 i32 i32 i32 i32 i32 i32 f64 f64 f64 f64 i32 f64 f64 f64 f64 f64 i32)
    i32.const 0
    i64.const 0
    i64.store offset=1072
    i32.const 0
    i64.const 0
    i64.store offset=1024
    i32.const 0
    i64.const 0
    i64.store offset=1120
    i32.const 0
    i64.const 4630752910647379422
    i64.store offset=1312
    i32.const 0
    i64.const 4617136985637443884
    i64.store offset=1032
    i32.const 0
    i64.const -4615467600764216452
    i64.store offset=1080
    i32.const 0
    i64.const -4631240860977730576
    i64.store offset=1128
    i32.const 0
    i64.const 4603636522180398268
    i64.store offset=1176
    i32.const 0
    i64.const 4613514450253485211
    i64.store offset=1224
    i32.const 0
    i64.const -4640446117579192555
    i64.store offset=1272
    i32.const 0
    i64.const 4585593052079010776
    i64.store offset=1320
    i32.const 0
    i64.const 4620886515960171111
    i64.store offset=1040
    i32.const 0
    i64.const 4616330128746480048
    i64.store offset=1088
    i32.const 0
    i64.const -4622431185293064580
    i64.store offset=1136
    i32.const 0
    i64.const -4616141094713322430
    i64.store offset=1184
    i32.const 0
    i64.const 4610900871547424531
    i64.store offset=1232
    i32.const 0
    i64.const 4576004977915405236
    i64.store offset=1280
    i32.const 0
    i64.const 4577659745833829943
    i64.store offset=1328
    i32.const 0
    i64.const 4623448502799161807
    i64.store offset=1048
    i32.const 0
    i64.const -4626158513131520608
    i64.store offset=1144
    i32.const 0
    i64.const -4598675596822288770
    i64.store offset=1096
    i32.const 0
    i64.const 4607555276345777135
    i64.store offset=1192
    i32.const 0
    i64.const 4605999890795117509
    i64.store offset=1240
    i32.const 0
    i64.const -4645973824767902084
    i64.store offset=1288
    i32.const 0
    i64.const 4565592097032511155
    i64.store offset=1336
    i32.const 0
    i64.const 4624847617829197610
    i64.store offset=1056
    i32.const 0
    i64.const -4595383180696444384
    i64.store offset=1104
    i32.const 0
    i64.const 4595626498235032896
    i64.store offset=1152
    i32.const 0
    i64.const 4606994084859067466
    i64.store offset=1200
    i32.const 0
    i64.const 4603531791922690979
    i64.store offset=1248
    i32.const 0
    i64.const -4638202354754755082
    i64.store offset=1296
    i32.const 0
    i64.const 4566835785178257836
    i64.store offset=1344
    i32.const 0
    i64.const -4667585285551237389
    i64.store offset=1168
    i32.const 0
    i64.const -4653673150589924869
    i64.store offset=1216
    i32.const 0
    i64.const 4537685806907361906
    i64.store offset=1264
    f64.const 0x1.6f1f393abe54p-3 (;=0.17925877295037118;)
    local.set 0
    f64.const -0x1.9eb5833c8a22p+4 (;=-25.919314609987964;)
    local.set 1
    f64.const 0x1.ec267a905572ap+3 (;=15.379697114850917;)
    local.set 2
    f64.const -0x1.c9557be257dap-3 (;=-0.22330757889265573;)
    local.set 3
    f64.const -0x1.e38e8d626667ep+3 (;=-15.111151401698631;)
    local.set 4
    f64.const 0x1.9c9eacea7d9cfp+3 (;=12.894369562139131;)
    local.set 5
    f64.const -0x1.9d353e1eb467cp-2 (;=-0.4035234171143214;)
    local.set 6
    f64.const 0x1.07fcb31de01bp+2 (;=4.124798564124305;)
    local.set 7
    f64.const 0x1.0afcdc332ca67p+3 (;=8.34336671824458;)
    local.set 8
    f64.const -0x1.a86f96c25ebfp-4 (;=-0.10362204447112311;)
    local.set 9
    f64.const -0x1.290abc01fdb7cp+0 (;=-1.1603200440274284;)
    local.set 10
    f64.const 0x1.35da0343cd92cp+2 (;=4.841431442464721;)
    local.set 11
    f64.const 0x0p+0 (;=0;)
    local.set 12
    i32.const 0
    local.set 13
    f64.const 0x0p+0 (;=0;)
    local.set 14
    f64.const 0x0p+0 (;=0;)
    local.set 15
    loop ;; label = @1
      i32.const 4
      local.set 16
      i32.const 0
      local.set 17
      i32.const 0
      local.set 18
      loop ;; label = @2
        block ;; label = @3
          local.get 18
          i32.const 3
          i32.gt_u
          br_if 0 (;@3;)
          local.get 18
          i32.const 3
          i32.shl
          local.tee 19
          i32.const 1264
          i32.add
          local.set 20
          local.get 19
          i32.const 1216
          i32.add
          local.set 21
          local.get 19
          i32.const 1168
          i32.add
          local.set 22
          local.get 19
          f64.load offset=1312
          local.set 23
          local.get 19
          f64.load offset=1120
          local.set 24
          local.get 19
          f64.load offset=1072
          local.set 25
          local.get 19
          f64.load offset=1024
          local.set 26
          local.get 17
          local.set 19
          local.get 16
          local.set 27
          loop ;; label = @4
            local.get 22
            local.get 22
            f64.load
            local.get 26
            local.get 19
            i32.const 1032
            i32.add
            f64.load
            f64.sub
            local.tee 28
            local.get 19
            i32.const 1320
            i32.add
            f64.load
            local.tee 29
            f64.mul
            f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
            local.get 24
            local.get 19
            i32.const 1128
            i32.add
            f64.load
            f64.sub
            local.tee 30
            local.get 30
            f64.mul
            local.get 28
            local.get 28
            f64.mul
            local.get 25
            local.get 19
            i32.const 1080
            i32.add
            f64.load
            f64.sub
            local.tee 31
            local.get 31
            f64.mul
            f64.add
            f64.add
            local.tee 32
            call $sqrt_approx
            local.get 32
            f64.mul
            f64.div
            local.tee 32
            f64.mul
            f64.sub
            f64.store
            local.get 21
            local.get 21
            f64.load
            local.get 31
            local.get 29
            f64.mul
            local.get 32
            f64.mul
            f64.sub
            f64.store
            local.get 20
            local.get 20
            f64.load
            local.get 30
            local.get 29
            f64.mul
            local.get 32
            f64.mul
            f64.sub
            f64.store
            local.get 19
            i32.const 1176
            i32.add
            local.tee 33
            local.get 23
            local.get 28
            f64.mul
            local.get 32
            f64.mul
            local.get 33
            f64.load
            f64.add
            f64.store
            local.get 19
            i32.const 1224
            i32.add
            local.tee 33
            local.get 23
            local.get 31
            f64.mul
            local.get 32
            f64.mul
            local.get 33
            f64.load
            f64.add
            f64.store
            local.get 19
            i32.const 1272
            i32.add
            local.tee 33
            local.get 23
            local.get 30
            f64.mul
            local.get 32
            f64.mul
            local.get 33
            f64.load
            f64.add
            f64.store
            local.get 19
            i32.const 8
            i32.add
            local.set 19
            local.get 27
            i32.const -1
            i32.add
            local.tee 27
            br_if 0 (;@4;)
          end
        end
        local.get 17
        i32.const 8
        i32.add
        local.set 17
        local.get 16
        i32.const -1
        i32.add
        local.set 16
        local.get 18
        i32.const 1
        i32.add
        local.tee 18
        i32.const 5
        i32.ne
        br_if 0 (;@2;)
      end
      i32.const 0
      i32.const 0
      f64.load offset=1168
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 12
      f64.add
      local.tee 12
      f64.store offset=1024
      i32.const 0
      i32.const 0
      f64.load offset=1216
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 14
      f64.add
      local.tee 14
      f64.store offset=1072
      i32.const 0
      i32.const 0
      f64.load offset=1264
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 15
      f64.add
      local.tee 15
      f64.store offset=1120
      i32.const 0
      i32.const 0
      f64.load offset=1176
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 11
      f64.add
      local.tee 11
      f64.store offset=1032
      i32.const 0
      i32.const 0
      f64.load offset=1224
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 10
      f64.add
      local.tee 10
      f64.store offset=1080
      i32.const 0
      i32.const 0
      f64.load offset=1272
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 9
      f64.add
      local.tee 9
      f64.store offset=1128
      i32.const 0
      i32.const 0
      f64.load offset=1184
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 8
      f64.add
      local.tee 8
      f64.store offset=1040
      i32.const 0
      i32.const 0
      f64.load offset=1232
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 7
      f64.add
      local.tee 7
      f64.store offset=1088
      i32.const 0
      i32.const 0
      f64.load offset=1280
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 6
      f64.add
      local.tee 6
      f64.store offset=1136
      i32.const 0
      i32.const 0
      f64.load offset=1192
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 5
      f64.add
      local.tee 5
      f64.store offset=1048
      i32.const 0
      i32.const 0
      f64.load offset=1240
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 4
      f64.add
      local.tee 4
      f64.store offset=1096
      i32.const 0
      i32.const 0
      f64.load offset=1288
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 3
      f64.add
      local.tee 3
      f64.store offset=1144
      i32.const 0
      i32.const 0
      f64.load offset=1200
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 2
      f64.add
      local.tee 2
      f64.store offset=1056
      i32.const 0
      i32.const 0
      f64.load offset=1248
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 1
      f64.add
      local.tee 1
      f64.store offset=1104
      i32.const 0
      i32.const 0
      f64.load offset=1296
      f64.const 0x1.47ae147ae147bp-7 (;=0.01;)
      f64.mul
      local.get 0
      f64.add
      local.tee 0
      f64.store offset=1152
      local.get 13
      i32.const 1
      i32.add
      local.tee 13
      i32.const 100000
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 21
    f64.const 0x0p+0 (;=0;)
    local.set 32
    i32.const 4
    local.set 27
    i32.const 8
    local.set 22
    loop ;; label = @1
      local.get 21
      i32.const 3
      i32.shl
      local.tee 19
      f64.load offset=1312
      local.tee 30
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.get 19
      f64.load offset=1264
      local.tee 28
      local.get 28
      f64.mul
      local.get 19
      f64.load offset=1168
      local.tee 28
      local.get 28
      f64.mul
      local.get 19
      f64.load offset=1216
      local.tee 28
      local.get 28
      f64.mul
      f64.add
      f64.add
      f64.mul
      local.get 32
      f64.add
      local.set 32
      block ;; label = @2
        local.get 21
        i32.const 3
        i32.gt_u
        br_if 0 (;@2;)
        local.get 19
        f64.load offset=1120
        local.set 31
        local.get 19
        f64.load offset=1072
        local.set 23
        local.get 19
        f64.load offset=1024
        local.set 29
        local.get 22
        local.set 19
        local.get 27
        local.set 20
        loop ;; label = @3
          local.get 32
          local.get 30
          local.get 19
          i32.const 1312
          i32.add
          f64.load
          f64.mul
          local.get 31
          local.get 19
          i32.const 1120
          i32.add
          f64.load
          f64.sub
          local.tee 28
          local.get 28
          f64.mul
          local.get 29
          local.get 19
          i32.const 1024
          i32.add
          f64.load
          f64.sub
          local.tee 28
          local.get 28
          f64.mul
          local.get 23
          local.get 19
          i32.const 1072
          i32.add
          f64.load
          f64.sub
          local.tee 28
          local.get 28
          f64.mul
          f64.add
          f64.add
          call $sqrt_approx
          f64.div
          f64.sub
          local.set 32
          local.get 19
          i32.const 8
          i32.add
          local.set 19
          local.get 20
          i32.const -1
          i32.add
          local.tee 20
          br_if 0 (;@3;)
        end
      end
      local.get 22
      i32.const 8
      i32.add
      local.set 22
      local.get 27
      i32.const -1
      i32.add
      local.set 27
      local.get 21
      i32.const 1
      i32.add
      local.tee 21
      i32.const 5
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 32
    f64.const 0x1.dcd65p+29 (;=1000000000;)
    f64.mul
    i32.trunc_sat_f64_s
  )
  (func $sqrt_approx (;2;) (type 2) (param f64) (result f64)
    (local f64)
    f64.const 0x0p+0 (;=0;)
    local.set 1
    block ;; label = @1
      local.get 0
      f64.const 0x0p+0 (;=0;)
      f64.le
      br_if 0 (;@1;)
      local.get 0
      local.get 0
      local.get 0
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.tee 1
      local.get 0
      local.get 1
      f64.div
      f64.add
      f64.const 0x1p-1 (;=0.5;)
      f64.mul
      local.set 1
    end
    local.get 1
  )
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
