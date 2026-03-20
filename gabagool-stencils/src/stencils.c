
#include "stencil_context.h"

void nop(StencilContext *ctx) {
  ctx->pc += 1;

  if (ctx->snapshot_flag) {
    ctx->exit_reason = EXIT_SNAPSHOT;
    return;
  }

  __attribute__((musttail)) return ctx->fn_table[ctx->pc](ctx);
}

void i32_const(StencilContext *ctx) {
  ctx->stack[ctx->stack_pointer] = (uint32_t)ctx->imm_table[ctx->pc].imm0;

  ctx->stack_pointer += 1;
  ctx->pc += 1;

  if (ctx->snapshot_flag) {
    ctx->exit_reason = EXIT_SNAPSHOT;
    return;
  }

  __attribute__((musttail)) return ctx->fn_table[ctx->pc](ctx);
}

void return_(StencilContext *ctx) { ctx->exit_reason = EXIT_RETURN; }