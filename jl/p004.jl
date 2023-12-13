
function palindrome(n)
    if !isfinite(n)
        return 0
    end
    maxk = 0
    while 10^maxk <= n
        maxk += 1
    end
    maxk = maxk-1
    d_list = zeros(Int64, 0)
    for k in maxk:-1:0
        d = div(n, 10^k)
        push!(d_list, d)
        n = n - d*10^k
    end
    append!(d_list, d_list[end:-1:1])
    s = 0
    for i in length(d_list):-1:1
        s += d_list[i]*10^(i-1)
    end
    return s
end

function isproduct(m, p)
    s1 = 10^(p-1)
    s2 = 10^p -1
    for i in s1:s2, j in s1:s2
        if i*j == m
            return true
        end
    end
    return false
end

function solution(p)
    for n in (10^p - 1):-1:(10^(p-1))
        m = palindrome(n)
        if isproduct(m, p)
            return m
        end
    end
    return 0
end

@time palindrome(0) == 0
@time palindrome(1) == 11
@time palindrome(9894) == 98944989

@time solution(1)
@time solution(2)
@time solution(3)
