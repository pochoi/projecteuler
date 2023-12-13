
function solution1(n)
    p = BigInt(2)^n
    s = string(p)
    out = 0
    for i in 1:length(s)
        out += parse(Int, s[i])
    end
    return out
end

solution2(n) = sum(digits(BigInt(2)^n))


@time solution1(15)
@time solution2(15)

@time solution1(1000)
@time solution2(1000) # Surprisingly, solution 2 is slower!
