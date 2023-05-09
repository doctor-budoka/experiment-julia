# using Pkg ; Pkg.add("Distributions") ; Pkg.add("CSV") ; Pkg.add("Tables")
using Distributions
using CSV, Tables

SLOPE = 3
INTERCEPT = -1

function rand_data(n)
    feature = (collect(1:n))
    f(z) = SLOPE*z + INTERCEPT 
    y_0 = map(f, feature)
    ϵ = rand(Truncated(Normal(0, 3), -5, 5), n)
    y = y_0 + ϵ
    data = reshape([feature ; y], n, 2)
    return data
end

function lin_regression(data)
    x = data[:, 1]
    y = data[:, 2]
    n = size(data)[1]
    fullx = reshape([ones(n) ; x], n, 2)
    fullx_t = transpose(fullx)
    β = inv(fullx_t * fullx)*(fullx_t * y)
    return β
end

data = rand_data(1000)
lin_regression(data)

