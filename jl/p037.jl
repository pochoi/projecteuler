
function allprime!(ps, n)
    if n < 2
        return ps
    end

    if length(ps) == 0
        push!(ps, 2)
    end
    index = (3:2:n)[(3:2:n) .> ps[end]]
    for k in index
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

inversedigits(d) = sum([d[k]*10^(k-1) for k=1:length(d)])
idright(n, k) = inversedigits(digits(n)[1:k])
idleft(n, k) = inversedigits(digits(n)[(end-k+1):end])

function allprime_checktruncatable(n)
    if n < 2
        return Int64[], Int64[]
    end

    ps = Int64[2]
    t = Bool[true]

    index = 3:2:n
    for k in index
        flag = true
        for p in ps
            p^2 <= k || break
            (flag = flag && (k % p != 0)) || break
        end
        if flag
            push!(ps, k)
            push!(t, checktruncatable(k, ps))
        end
    end
    return ps, t
end

function checktruncatable(p, ps)
    d = digits(p)
    if d[1] ∈ [4,6,8,9,0] || d[end] ∈ [4,6,8,9,0]
        return false
    end
    if d[1] == [2, 5]
        return false
    end

    flag = true
    for k in 1:length(d)
        if !(inversedigits(d[1:k]) ∈ ps) || !(inversedigits(d[(end-k+1):end]) ∈ ps)
             flag = false
             break
        end
    end
    return flag
end

function solution(n)
    ps, t = allprime_checktruncatable(n)
    p = ps[t]
    println(p)
    return sum(p[p .> 10])
end

solution(100)
@time solution(1000000)
