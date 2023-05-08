primes = Set([])
for i in 2:50
    flag = false
    for j in primes
        (i % j == 0) && (flag = true)
    end
    flag || push!(primes, i)
end

prime_list = sort!(collect(primes))
println("Elements are \n")
for i in prime_list
    println(i)
end