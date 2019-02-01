
# Benchmark for exercism raindrops

## Run benchmarks

```
julia --project=@. raindrops_benchmark.jl
```

## Result

Using julia 1.0.3 on Ubuntu 18.04, Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz

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
