using Pkg ; Pkg.add("Distributions") ; Pkg.add("CSV") ; Pkg.add("Tables")
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
    CSV.write("reg_data.csv",  Tables.table(data), writeheader=false)
end

rand_data(40)
