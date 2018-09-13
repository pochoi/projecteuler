
function factor(m)
    f = Int64[1]
    for k in 2:div(m,2)
        if m % k == 0
            push!(f, k)
        end
    end
    return f
end

function amicable(n)
    out = Int64[]
    for a in 2:n
        b = sum(factor(a))
        aa = sum(factor(b))
        if a < b && a == aa
            push!(out, a)
            push!(out, b)
        end
    end
    return out
end

function solution(n)
    a = amicable(n)
    if length(a) == 0
        return 0
    else
        return sum(a)
    end
end

solution(300)

@time solution(10000)
