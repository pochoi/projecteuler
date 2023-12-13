
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

function solution_successive(nums::AbstractVector{T}) where T <: Integer
    len = length(nums)
    if len == 0
        return 0
    end
    s = nums[1]
    for k in 2:len
        s = solution([s, nums[k]])
    end
    return s
end

function solution_recursive(nums::AbstractVector{T}) where T <: Integer
    len = length(nums)
    if len <= 2
        return solution(nums)
    else
        lenhalf = div(len, 2)
        a = solution_recursive(nums[1:lenhalf])
        b = solution_recursive(nums[lenhalf+1:end])
        return solution([a, b])
    end
    return 0
end


@time solution(2:10) == 2520
@time s = solution(2:20)

@time solution(10) == 2520
@time solution(20) == s

@time solution_successive(2:10) == 2520
@time solution_successive(2:20) == s

@time solution_recursive(2:10) == 2520
@time solution_recursive(2:20) == s
