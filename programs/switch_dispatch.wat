(module $switch_dispatch.wasm
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (memory (;0;) 2)
  (global $__stack_pointer (;0;) (mut i32) i32.const 66624)
  (global (;1;) i32 i32.const 1024)
  (global (;2;) i32 i32.const 1088)
  (global (;3;) i32 i32.const 1088)
  (global (;4;) i32 i32.const 66624)
  (global (;5;) i32 i32.const 1024)
  (global (;6;) i32 i32.const 66624)
  (global (;7;) i32 i32.const 131072)
  (global (;8;) i32 i32.const 0)
  (global (;9;) i32 i32.const 1)
  (global (;10;) i32 i32.const 65536)
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "switch_bench" (func $switch_bench))
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
  (func $switch_bench (;1;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 0
    i64.const 68719476751
    i64.store offset=1080
    i32.const 0
    i64.const 60129542157
    i64.store offset=1072
    i32.const 0
    i64.const 51539607563
    i64.store offset=1064
    i32.const 0
    i64.const 42949672969
    i64.store offset=1056
    i32.const 0
    i64.const 34359738375
    i64.store offset=1048
    i32.const 0
    i64.const 25769803781
    i64.store offset=1040
    i32.const 0
    i64.const 17179869187
    i64.store offset=1032
    i32.const 0
    i64.const 8589934593
    i64.store offset=1024
    i32.const -559038737
    local.set 0
    i32.const 1000000
    local.set 1
    loop ;; label = @1
      local.get 0
      i32.const 1664525
      i32.mul
      i32.const 1013904223
      i32.add
      local.tee 0
      i32.const 15
      i32.and
      local.set 2
      local.get 0
      i32.const 8
      i32.shr_u
      i32.const 15
      i32.and
      local.set 3
      local.get 0
      i32.const 2
      i32.shr_u
      i32.const 60
      i32.and
      i32.load offset=1024
      local.set 4
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              block ;; label = @22
                                                local.get 0
                                                i32.const 16
                                                i32.shr_u
                                                i32.const 20
                                                i32.rem_u
                                                br_table 0 (;@22;) 1 (;@21;) 2 (;@20;) 3 (;@19;) 4 (;@18;) 5 (;@17;) 6 (;@16;) 7 (;@15;) 8 (;@14;) 9 (;@13;) 10 (;@12;) 11 (;@11;) 12 (;@10;) 13 (;@9;) 14 (;@8;) 15 (;@7;) 16 (;@6;) 17 (;@5;) 18 (;@4;) 19 (;@3;) 0 (;@22;)
                                              end
                                              local.get 3
                                              i32.const 2
                                              i32.shl
                                              local.get 2
                                              i32.const 2
                                              i32.shl
                                              i32.load offset=1024
                                              local.get 4
                                              i32.add
                                              i32.store offset=1024
                                              br 19 (;@2;)
                                            end
                                            local.get 3
                                            i32.const 2
                                            i32.shl
                                            local.get 4
                                            local.get 2
                                            i32.const 2
                                            i32.shl
                                            i32.load offset=1024
                                            i32.sub
                                            i32.store offset=1024
                                            br 18 (;@2;)
                                          end
                                          local.get 3
                                          i32.const 2
                                          i32.shl
                                          local.get 2
                                          i32.const 2
                                          i32.shl
                                          i32.load offset=1024
                                          local.get 4
                                          i32.mul
                                          i32.store offset=1024
                                          br 17 (;@2;)
                                        end
                                        local.get 3
                                        i32.const 2
                                        i32.shl
                                        local.get 2
                                        i32.const 2
                                        i32.shl
                                        i32.load offset=1024
                                        local.get 4
                                        i32.and
                                        i32.store offset=1024
                                        br 16 (;@2;)
                                      end
                                      local.get 3
                                      i32.const 2
                                      i32.shl
                                      local.get 2
                                      i32.const 2
                                      i32.shl
                                      i32.load offset=1024
                                      local.get 4
                                      i32.or
                                      i32.store offset=1024
                                      br 15 (;@2;)
                                    end
                                    local.get 3
                                    i32.const 2
                                    i32.shl
                                    local.get 2
                                    i32.const 2
                                    i32.shl
                                    i32.load offset=1024
                                    local.get 4
                                    i32.xor
                                    i32.store offset=1024
                                    br 14 (;@2;)
                                  end
                                  local.get 3
                                  i32.const 2
                                  i32.shl
                                  local.get 4
                                  local.get 2
                                  i32.const 2
                                  i32.shl
                                  i32.load offset=1024
                                  i32.shl
                                  i32.store offset=1024
                                  br 13 (;@2;)
                                end
                                local.get 3
                                i32.const 2
                                i32.shl
                                local.get 4
                                local.get 2
                                i32.const 2
                                i32.shl
                                i32.load offset=1024
                                i32.shr_s
                                i32.store offset=1024
                                br 12 (;@2;)
                              end
                              local.get 3
                              i32.const 2
                              i32.shl
                              local.get 4
                              i32.const -1
                              i32.xor
                              i32.store offset=1024
                              br 11 (;@2;)
                            end
                            local.get 3
                            i32.const 2
                            i32.shl
                            i32.const 0
                            local.get 4
                            i32.sub
                            i32.store offset=1024
                            br 10 (;@2;)
                          end
                          local.get 3
                          i32.const 2
                          i32.shl
                          local.get 4
                          i32.const 1
                          i32.add
                          i32.store offset=1024
                          br 9 (;@2;)
                        end
                        local.get 3
                        i32.const 2
                        i32.shl
                        local.get 4
                        i32.const -1
                        i32.add
                        i32.store offset=1024
                        br 8 (;@2;)
                      end
                      local.get 3
                      i32.const 2
                      i32.shl
                      local.get 4
                      local.get 2
                      i32.const 2
                      i32.shl
                      i32.load offset=1024
                      i32.lt_s
                      i32.store offset=1024
                      br 7 (;@2;)
                    end
                    local.get 3
                    i32.const 2
                    i32.shl
                    local.get 4
                    local.get 2
                    i32.const 2
                    i32.shl
                    i32.load offset=1024
                    i32.eq
                    i32.store offset=1024
                    br 6 (;@2;)
                  end
                  local.get 3
                  i32.const 2
                  i32.shl
                  local.get 4
                  local.get 2
                  i32.const 2
                  i32.shl
                  i32.load offset=1024
                  i32.ne
                  i32.store offset=1024
                  br 5 (;@2;)
                end
                local.get 3
                i32.const 2
                i32.shl
                local.get 4
                local.get 2
                i32.const 2
                i32.shl
                i32.load offset=1024
                i32.gt_s
                i32.store offset=1024
                br 4 (;@2;)
              end
              local.get 3
              i32.const 2
              i32.shl
              local.get 4
              local.get 2
              i32.const 2
              i32.shl
              i32.load offset=1024
              i32.add
              i32.const 1
              i32.add
              i32.store offset=1024
              br 3 (;@2;)
            end
            local.get 3
            i32.const 2
            i32.shl
            local.tee 3
            local.get 2
            i32.const 2
            i32.shl
            i32.load offset=1024
            local.get 4
            i32.xor
            local.get 3
            i32.load offset=1024
            i32.add
            i32.store offset=1024
            br 2 (;@2;)
          end
          local.get 3
          i32.const 2
          i32.shl
          local.get 2
          i32.const 2
          i32.shl
          i32.load offset=1024
          i32.const 8
          i32.shl
          local.get 4
          i32.const 255
          i32.and
          i32.or
          i32.store offset=1024
          br 1 (;@2;)
        end
        local.get 3
        i32.const 2
        i32.shl
        local.get 2
        i32.const 2
        i32.shl
        i32.load offset=1024
        i32.const 16
        i32.shl
        local.get 4
        i32.const 16
        i32.shr_u
        i32.or
        i32.store offset=1024
      end
      local.get 1
      i32.const -1
      i32.add
      local.tee 1
      br_if 0 (;@1;)
    end
    i32.const 0
    i32.load offset=1084
    i32.const 0
    i32.load offset=1080
    i32.const 0
    i32.load offset=1076
    i32.const 0
    i32.load offset=1072
    i32.const 0
    i32.load offset=1068
    i32.const 0
    i32.load offset=1064
    i32.const 0
    i32.load offset=1060
    i32.const 0
    i32.load offset=1056
    i32.const 0
    i32.load offset=1052
    i32.const 0
    i32.load offset=1048
    i32.const 0
    i32.load offset=1044
    i32.const 0
    i32.load offset=1040
    i32.const 0
    i32.load offset=1036
    i32.const 0
    i32.load offset=1032
    i32.const 0
    i32.load offset=1028
    i32.const 0
    i32.load offset=1024
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
    i32.xor
  )
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
