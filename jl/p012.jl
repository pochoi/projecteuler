
function factor(m)
    c = 0
    for k in 1:m
        if m % k == 0
            c += 1
        end
    end
    return c
end

function searchfactor(m)
    t1 = m*(2m+1)
    t2 = (m+1)*(2m+1)
    f1 = factor(m)*factor(2m+1)
    f2 = factor(m+1)*factor(2m+1)
    return t1, f1, t2, f2
end

function solution(fmax)
    for m in 1:(10^7)
        t1, f1, t2, f2 = searchfactor(m)
        if f1 >= fmax
            return t1
        end
        if f2 >= fmax
            return t2
        end
    end
    return 0
end

solution(5) == 28
@time solution(500)
