
fifthPower(n) = sum(digits(n).^5)

function solution()
    maxn = 1
    while length(digits(maxn*9^5)) > maxn
        maxn += 1
    end

    f = Int64[]
    for n in 2:(10^maxn-1)
        if fifthPower(n) == n
            push!(f, n)
        end
    end

    return sum(f)
end


@time solution()
