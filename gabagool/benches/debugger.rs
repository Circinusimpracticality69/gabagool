use criterion::{criterion_group, criterion_main, BenchmarkId, Criterion};
use gabagool::debugger::{Debugger, DebuggerConfig, StepResult};
use gabagool::{Module, RawValue, Store};
use std::fs;

fn make_debugger(wasm: &[u8], func: &str, args: Vec<RawValue>, config: DebuggerConfig) -> Debugger {
    let module = Module::new(wasm).unwrap();
    let mut store = Store::new();
    let instance = store.instantiate(&module, vec![]).unwrap();
    let mut debugger = Debugger::new_with_config(store, instance, config);
    debugger.start(func, args).unwrap();
    debugger
}

fn default_config() -> DebuggerConfig {
    DebuggerConfig {
        decay_buffer_capacity: 1_000,
        half_life: 50.0,
        instructions_between_snapshots: 1_000,
    }
}

/// Benchmark: cost of taking a single snapshot at a given point in execution.
fn bench_snapshot_creation(c: &mut Criterion) {
    let mut group = c.benchmark_group("snapshot_creation");

    // linked_list: heavy memory allocation
    let wasm = fs::read("programs/linked_list.wasm").unwrap();
    let module = Module::new(&wasm).unwrap();

    for step_count in [1_000u64, 5_000, 10_000] {
        group.bench_with_input(
            BenchmarkId::new("linked_list", step_count),
            &step_count,
            |b, &steps| {
                b.iter_with_setup(
                    || {
                        let mut store = Store::new();
                        let instance = store.instantiate(&module, vec![]).unwrap();
                        store.set_fuel(0);
                        store.invoke(instance, "linked_list_bench", vec![]).unwrap();
                        store.set_fuel(steps);
                        let _ = store.resume().unwrap();
                        store
                    },
                    |store| store.snapshot(),
                );
            },
        );
    }

    group.finish();
}

/// Benchmark: stepping forward N instructions with snapshot overhead.
fn bench_step_forward(c: &mut Criterion) {
    let mut group = c.benchmark_group("step_forward");
    group.sample_size(10);

    let programs: &[(&str, &str, Vec<RawValue>)] = &[
        ("programs/linked_list.wasm", "linked_list_bench", vec![]),
        ("programs/sieve.wasm", "count_primes", vec![]),
        (
            "programs/fibonacci.wasm",
            "fib",
            vec![RawValue::from(20i32)],
        ),
    ];

    for (path, func, args) in programs {
        let name = path.split('/').last().unwrap().trim_end_matches(".wasm");
        let wasm = fs::read(path).unwrap();

        group.bench_function(BenchmarkId::new(name, "5000_steps"), |b| {
            b.iter_with_setup(
                || make_debugger(&wasm, func, args.clone(), default_config()),
                |mut dbg| {
                    for _ in 0..5_000 {
                        match dbg.step_forward().unwrap() {
                            StepResult::Completed => break,
                            _ => {}
                        }
                    }
                },
            );
        });
    }

    group.finish();
}

/// Benchmark: cost of stepping backward (restore from snapshot + replay).
fn bench_step_back(c: &mut Criterion) {
    let mut group = c.benchmark_group("step_back");

    let wasm = fs::read("programs/linked_list.wasm").unwrap();

    for snapshot_interval in [100u64, 500, 1_000] {
        group.bench_with_input(
            BenchmarkId::new("linked_list", format!("interval_{snapshot_interval}")),
            &snapshot_interval,
            |b, &interval| {
                b.iter_with_setup(
                    || {
                        let config = DebuggerConfig {
                            decay_buffer_capacity: 1_000,
                            half_life: 50.0,
                            instructions_between_snapshots: interval,
                        };
                        let mut dbg = make_debugger(&wasm, "linked_list_bench", vec![], config);
                        // Step forward enough to have snapshots in history
                        for _ in 0..5_000 {
                            match dbg.step_forward().unwrap() {
                                StepResult::Completed => break,
                                _ => {}
                            }
                        }
                        dbg
                    },
                    |mut dbg| {
                        dbg.step_back().unwrap();
                    },
                );
            },
        );
    }

    group.finish();
}

/// Benchmark: snapshot memory overhead — measures total bytes of N snapshots.
fn bench_snapshot_size(c: &mut Criterion) {
    let mut group = c.benchmark_group("snapshot_size");

    let wasm = fs::read("programs/linked_list.wasm").unwrap();
    let module = Module::new(&wasm).unwrap();

    group.bench_function("linked_list_10_snapshots", |b| {
        b.iter_with_setup(
            || {
                let mut store = Store::new();
                let instance = store.instantiate(&module, vec![]).unwrap();
                store.set_fuel(0);
                store.invoke(instance, "linked_list_bench", vec![]).unwrap();
                store
            },
            |mut store| {
                let mut total_bytes = 0usize;
                for _ in 0..10 {
                    store.set_fuel(1_000);
                    let _ = store.resume().unwrap();
                    let snap = store.snapshot();
                    total_bytes += snap.len();
                    std::hint::black_box(&snap);
                }
                total_bytes
            },
        );
    });

    group.finish();
}

/// Benchmark: full debugger session — step forward then step backward through
/// a program, simulating a real debugging session.
fn bench_debug_session(c: &mut Criterion) {
    let mut group = c.benchmark_group("debug_session");
    group.sample_size(10);

    let wasm = fs::read("programs/sieve.wasm").unwrap();

    group.bench_function("sieve_forward_2000_back_500", |b| {
        b.iter_with_setup(
            || make_debugger(&wasm, "count_primes", vec![], default_config()),
            |mut dbg| {
                for _ in 0..2_000 {
                    match dbg.step_forward().unwrap() {
                        StepResult::Completed => break,
                        _ => {}
                    }
                }
                for _ in 0..500 {
                    dbg.step_back().unwrap();
                }
            },
        );
    });

    group.finish();
}

criterion_group!(
    benches,
    bench_snapshot_creation,
    bench_step_forward,
    bench_step_back,
    bench_snapshot_size,
    bench_debug_session,
);
criterion_main!(benches);
