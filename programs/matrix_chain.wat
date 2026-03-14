(module $matrix_chain.wasm
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (memory (;0;) 4)
  (global $__stack_pointer (;0;) (mut i32) i32.const 227376)
  (global (;1;) i32 i32.const 1024)
  (global (;2;) i32 i32.const 161840)
  (global (;3;) i32 i32.const 161840)
  (global (;4;) i32 i32.const 227376)
  (global (;5;) i32 i32.const 1024)
  (global (;6;) i32 i32.const 227376)
  (global (;7;) i32 i32.const 262144)
  (global (;8;) i32 i32.const 0)
  (global (;9;) i32 i32.const 1)
  (global (;10;) i32 i32.const 65536)
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "matrix_chain_bench" (func $matrix_chain_bench))
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
  (func $matrix_chain_bench (;1;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 271828
    local.set 0
    i32.const -800
    local.set 1
    loop (result i32) ;; label = @1
      local.get 1
      i32.const 1824
      i32.add
      local.get 0
      i32.const 1103515245
      i32.mul
      i32.const 12345
      i32.add
      local.tee 0
      i32.const 16
      i32.shr_u
      i32.const 100
      i32.rem_u
      i32.const 10
      i32.add
      i32.store
      block ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        loop ;; label = @3
          local.get 1
          i32.const 5056
          i32.add
          i32.const 0
          i32.store
          local.get 1
          i32.const 4252
          i32.add
          i32.const 0
          i32.store
          local.get 1
          i32.const 3448
          i32.add
          i32.const 0
          i32.store
          local.get 1
          i32.const 2644
          i32.add
          i32.const 0
          i32.store
          local.get 1
          i32.const 1840
          i32.add
          i32.const 0
          i32.store
          local.get 1
          i32.const 4020
          i32.add
          local.tee 1
          i32.const 160800
          i32.ne
          br_if 0 (;@3;)
        end
        i32.const 199
        local.set 2
        i32.const 2644
        local.set 3
        i32.const 0
        local.set 4
        i32.const 1
        local.set 5
        i32.const 2
        local.set 6
        loop ;; label = @3
          local.get 5
          i32.const 1
          i32.and
          local.set 7
          i32.const 0
          local.get 5
          i32.const -2
          i32.and
          i32.sub
          local.set 8
          i32.const 1024
          local.set 9
          local.get 3
          local.set 10
          i32.const 1840
          local.set 11
          i32.const 0
          local.set 12
          loop ;; label = @4
            i32.const 2147483647
            local.set 13
            local.get 12
            local.get 6
            i32.add
            i32.const 2
            i32.shl
            local.tee 14
            local.get 12
            i32.const 800
            i32.mul
            i32.const 1840
            i32.add
            local.tee 15
            i32.add
            i32.const -4
            i32.add
            local.tee 16
            i32.const 2147483647
            i32.store
            local.get 12
            i32.const 2
            i32.shl
            i32.load offset=1024
            local.get 14
            i32.load offset=1024
            i32.mul
            local.set 17
            local.get 12
            local.set 1
            block ;; label = @5
              block ;; label = @6
                local.get 4
                i32.eqz
                br_if 0 (;@6;)
                i32.const 2147483647
                local.set 13
                i32.const 0
                local.set 1
                local.get 10
                local.set 0
                i32.const 0
                local.set 18
                loop ;; label = @7
                  block ;; label = @8
                    local.get 0
                    i32.load
                    local.get 11
                    local.get 1
                    i32.add
                    local.tee 19
                    i32.load
                    i32.add
                    local.get 9
                    local.get 1
                    i32.add
                    local.tee 20
                    i32.const 4
                    i32.add
                    i32.load
                    local.get 17
                    i32.mul
                    i32.add
                    local.tee 21
                    local.get 13
                    i32.ge_s
                    br_if 0 (;@8;)
                    local.get 16
                    local.get 21
                    i32.store
                    local.get 21
                    local.set 13
                  end
                  block ;; label = @8
                    local.get 0
                    i32.const 800
                    i32.add
                    i32.load
                    local.get 19
                    i32.const 4
                    i32.add
                    i32.load
                    i32.add
                    local.get 20
                    i32.const 8
                    i32.add
                    i32.load
                    local.get 17
                    i32.mul
                    i32.add
                    local.tee 19
                    local.get 13
                    i32.ge_s
                    br_if 0 (;@8;)
                    local.get 16
                    local.get 19
                    i32.store
                    local.get 19
                    local.set 13
                  end
                  local.get 0
                  i32.const 1600
                  i32.add
                  local.set 0
                  local.get 1
                  i32.const 8
                  i32.add
                  local.set 1
                  local.get 8
                  local.get 18
                  i32.const -2
                  i32.add
                  local.tee 18
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.eqz
                br_if 1 (;@5;)
                local.get 12
                local.get 18
                i32.sub
                local.set 1
              end
              local.get 14
              i32.const 1836
              i32.add
              local.get 1
              i32.const 1
              i32.add
              local.tee 0
              i32.const 800
              i32.mul
              i32.add
              i32.load
              local.get 15
              local.get 1
              i32.const 2
              i32.shl
              i32.add
              i32.load
              i32.add
              local.get 0
              i32.const 2
              i32.shl
              i32.load offset=1024
              local.get 17
              i32.mul
              i32.add
              local.tee 1
              local.get 13
              i32.ge_s
              br_if 0 (;@5;)
              local.get 16
              local.get 1
              i32.store
            end
            local.get 10
            i32.const 804
            i32.add
            local.set 10
            local.get 11
            i32.const 804
            i32.add
            local.set 11
            local.get 9
            i32.const 4
            i32.add
            local.set 9
            local.get 12
            i32.const 1
            i32.add
            local.tee 12
            local.get 2
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 3
          i32.const 4
          i32.add
          local.set 3
          local.get 4
          i32.const 1
          i32.add
          local.set 4
          local.get 2
          i32.const -1
          i32.add
          local.set 2
          local.get 6
          i32.const 1
          i32.add
          local.set 6
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 200
          i32.ne
          br_if 0 (;@3;)
        end
        i32.const 0
        i32.load offset=2636
        return
      end
      local.get 1
      i32.const 1828
      i32.add
      local.get 0
      i32.const 1103515245
      i32.mul
      i32.const 12345
      i32.add
      local.tee 0
      i32.const 16
      i32.shr_u
      i32.const 100
      i32.rem_u
      i32.const 10
      i32.add
      i32.store
      local.get 1
      i32.const 8
      i32.add
      local.set 1
      br 0 (;@1;)
    end
  )
  (@producers
    (processed-by "Homebrew clang" "22.1.0")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
)
