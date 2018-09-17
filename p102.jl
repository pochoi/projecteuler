
using LinearAlgebra
function orientation(x)
    lg = sign.([det([x[1] x[2]; x[3] x[4]]), det([x[3] x[4]; x[5] x[6]]), det([x[5] x[6]; x[1] x[2]])]) .> 0
    if all(lg) || all(.!lg)
        return true
    end
    return false
end

function solution(t)
    s = 0
    for i in 1:size(t, 1)
        s += orientation(t[i,:])
    end
    return s
end

using DelimitedFiles

t = readdlm("p102_triangles.txt", ',', Float64, '\n')

solution(t)
@time solution(t)
