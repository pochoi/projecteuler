
fs(n) = sum(factorial.(digits(n)))

function solution()
    k = 1
    f9 = factorial(9)
    while f9*k > 10^k - 1
        k += 1
    end
    
    nums = Int64[]
    for n in 10:(10^k-1)
        if fs(n) == n
            push!(nums, n)
        end
    end
    return sum(nums)
end

solution()
@time solution()
