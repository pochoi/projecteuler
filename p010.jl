
function allprime(n)
    if n < 2
        return Int64[]
    end

    c = 0
    ps = Int64[]
    for k in [2; 3:2:n]
        flag = true
        for p in ps
            p^2 <= k || break
            (flag = flag && (k % p != 0)) || break
        end
        if flag
            push!(ps, k)
        end
    end
    return ps
end

function solution(n)
    ps = allprime(n)
    return sum(ps)
end

solution(10) == 17
@time solution(2000000)
