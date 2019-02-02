
# Benchmark for exercism raindrops

## Run benchmarks

```
julia --project=@. raindrops_benchmark.jl
```

## Results

Using julia 1.0.3 on Ubuntu 18.04, Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz

### Corrected benchmarks

:exclamation:
```
Thou shalt not benchmark in global scope
```

Moved `rain` inside functions: thank you, [@sbromberger](https://github.com/leonistor/raindrops-benchmark/issues/1#issuecomment-459872527)!

```
FUNCTIONAL
BenchmarkTools.Trial:
  memory estimate:  39.38 KiB
  allocs estimate:  837
  --------------
  minimum time:     13.797 μs (0.00% GC)
  median time:      14.440 μs (0.00% GC)
  mean time:        19.598 μs (22.24% GC)
  maximum time:     26.089 ms (99.92% GC)
  --------------
  samples:          10000
  evals/sample:     1

IMPERATIVE
BenchmarkTools.Trial:
  memory estimate:  31.30 KiB
  allocs estimate:  677
  --------------
  minimum time:     11.392 μs (0.00% GC)
  median time:      11.828 μs (0.00% GC)
  mean time:        16.655 μs (23.70% GC)
  maximum time:     25.980 ms (99.92% GC)
  --------------
  samples:          10000
  evals/sample:     1

RATIO
BenchmarkTools.TrialRatio:
  time:             1.2208319242475483
  gctime:           1.0
  memory:           1.2581128307538691
  allocs:           1.2363367799113738
```

-----

`const` in [raindrops_benchmark.jl, line 7](raindrops_benchmark.jl#L7)

### With `const`

```
FUNCTIONAL
BenchmarkTools.Trial:
  memory estimate:  8.45 KiB
  allocs estimate:  167
  --------------
  minimum time:     3.681 μs (0.00% GC)
  median time:      3.785 μs (0.00% GC)
  mean time:        4.564 μs (14.42% GC)
  maximum time:     3.322 ms (99.83% GC)
  --------------
  samples:          10000
  evals/sample:     8

IMPERATIVE
BenchmarkTools.Trial:
  memory estimate:  384 bytes
  allocs estimate:  7
  --------------
  minimum time:     1.338 μs (0.00% GC)
  median time:      1.441 μs (0.00% GC)
  mean time:        1.584 μs (4.55% GC)
  maximum time:     723.256 μs (99.74% GC)
  --------------
  samples:          10000
  evals/sample:     10

RATIO
BenchmarkTools.TrialRatio:
  time:             2.626630585623092
  gctime:           1.0
  memory:           22.541666666666668
  allocs:           23.857142857142858
```

### Without `const`
```
FUNCTIONAL
BenchmarkTools.Trial:
  memory estimate:  6.52 KiB
  allocs estimate:  170
  --------------
  minimum time:     4.919 μs (0.00% GC)
  median time:      5.009 μs (0.00% GC)
  mean time:        5.880 μs (11.79% GC)
  maximum time:     3.814 ms (99.71% GC)
  --------------
  samples:          10000
  evals/sample:     7

IMPERATIVE
BenchmarkTools.Trial:
  memory estimate:  9.56 KiB
  allocs estimate:  426
  --------------
  minimum time:     13.760 μs (0.00% GC)
  median time:      14.424 μs (0.00% GC)
  mean time:        18.687 μs (18.90% GC)
  maximum time:     26.634 ms (99.91% GC)
  --------------
  samples:          10000
  evals/sample:     1

RATIO
BenchmarkTools.TrialRatio:
  time:             0.3472507663584725
  gctime:           1.0
  memory:           0.6813725490196079
  allocs:           0.39906103286384975
```
