
# https://en.wikipedia.org/wiki/Least_common_multiple

function isAllEqual(nums::AbstractVector{T}) where T <: Integer
    flag = true
    for k in 1:length(nums)-1
        flag = flag && (nums[k] == nums[k+1])
    end
    return flag
end

function solution(nums::AbstractVector{T}) where T <: Integer
    x = copy(collect(nums))
    while !isAllEqual(x)
        k₀ = findmin(x)[2]
        x[k₀] += nums[k₀]
    end
    return x[1]
end

function allprime(n)
    ps = Int64[]
    for k in 2:n
        if all([k % p != 0 for p in ps])
            push!(ps, k)
        end
    end
    return ps
end

function solution(n::T) where T <: Integer
    ps = allprime(n)
    m = solution(ps)
    return solution([setdiff(2:n, ps); m])
end

@time solution(2:10) == 2520
@time s = solution(2:20)

@time solution(10) == 2520
@time solution(20) == s
