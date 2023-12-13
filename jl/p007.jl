
function allprime(n, mth)
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
            ((c += 1) < mth) || break
        end
    end
    return ps
end

function primeDensityEst(mth)
    if mth <= 2.5
        return mth+1
    end
    x = copy(mth)
    while abs(mth - x/log(x)) > 0.1
        x = x - (x*log(x) - mth*(log(x))^2)/(log(x) - 1)
    end
    return Int(ceil(x))
end

function solution(mth)
    ps = allprime(primeDensityEst(mth), mth)

    if length(ps) < mth
        #for safety
        ps = allprime(primeDensityEst(2*mth), mth)
    end
    return ps[mth]
end

@time solution(1000) == 7919

@time solution(10001)
