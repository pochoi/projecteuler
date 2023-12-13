function solution(n)
    s = 0
    k_old = 1
    k_mid = 0
    k_new = 1
    while k_new < n
        k_mid = k_new
        k_new = k_old + k_new
        k_old = k_mid
        if k_new % 2 == 0
            s += k_new
        end
    end
    return s
end

solution(40) == 44

@time solution(4000000)
