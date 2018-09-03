function solution(n₀)
    factor = 0
    n = n₀
    if n % 2 == 0
        factors = 2
        n = div(n, 2)
    end
    k = 3
    while k <= n
        if n % k == 0
            factor = k
            n = div(n, k)
        end
        k += 2
    end
    return factor
end

solution(13195) == 29

@time solution(600851475143)
