
function factor(m)
    f = Int64[1]
    for k in 2:div(m,2)
        if m % k == 0
            push!(f, k)
        end
    end
    return f
end

function solution(nmax)
    a = Int64[]
    for n in 1:nmax
        if n < sum(factor(n))
            push!(a, n)
        end
    end

    len_a = length(a)

    ls = Int64[]
    for i in 1:len_a
        j = i
        while j <= len_a && a[i] + a[j] <= nmax
            push!(ls, a[i] + a[j])
            j += 1
        end
    end

    return div(nmax*(nmax+1),2) - sum(unique(ls))
end

function sumfactor(nmax)
    d = zeros(Int64, nmax)
    for n = 1:div(nmax, 2)
        for k in (2n):n:nmax
            d[k] += n
        end
    end
    return d
end

function solution2(nmax)
    d = sumfactor(nmax)
    abundant = (1:nmax)[(1:nmax) .< d]

    s = 1
    for n in 2:nmax
        istwosum = false
        for a in abundant
            difference = n - a
            if difference <= 0 || istwosum
                break
            end
            if d[difference] > difference #Check if abundant
                istwosum = true
            end
        end
        if !istwosum
            s += n
        end
    end

    return s
end

@time solution(30)
@time solution2(30)

@time solution(28123)
@time solution2(28123)
