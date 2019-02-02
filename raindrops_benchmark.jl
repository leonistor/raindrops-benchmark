using BenchmarkTools
using Primes
using Random
using Statistics

function makerain()
    rain = [(3,"Pling"), (5,"Plang"), (7,"Plong")]
    for p in primes(11, 1000)
        push!(rain, (p, "factor:" * string(p)))
    end
    rain
end

# rng = MersenneTwister(1234)
# shuffle!(rng, rain)

function raindrops_functional(number::Int)
    rain = makerain()
    result = Base.mapfoldl(
        factor -> number % first(factor) == 0 ? last(factor) : "",
        *,
        rain)
    isempty(result) ? string(number) : result
end

function raindrops_imperative(number::Int)
    rain = makerain()
    result = ""

    for factor in rain
        if number % first(factor) == 0
            result *= last(factor)
        end
    end
    isempty(result) ? string(number) : result
end

# 3 * 5 * 97 * 439 * 643 * 919 * 937 = 353666226577605
t_func = @benchmark raindrops_functional(353666226577605)

t_imper = @benchmark raindrops_imperative(353666226577605)

r = ratio(median(t_func), median(t_imper))
println("\nFUNCTIONAL")
display(t_func)
println("\n\nIMPERATIVE")
display(t_imper)
println("\n\nRATIO")
display(r)
println("\n")
