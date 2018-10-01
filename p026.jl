#https://en.wikipedia.org/wiki/Repeating_decimal

function rd(n)
    k = 1
    dict = Dict{Int64, Int64}()
    while true
        r = mod(1*BigInt(10)^k, n)
        if r == 0
            return 0
        end
        if !haskey(dict, r)
            dict[r] = k
        else
            return k - dict[r]
        end
        k += 1
    end
end


solution(n) = findmax([rd(i) for i in 1:n])[2]

solution(10) == 7
@time solution(1000)
