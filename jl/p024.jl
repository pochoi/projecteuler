

function find_position(target, width)
    return div(target-1, width) + 1, (target-1) % width + 1
end

function solution(target)
    n = 1
    while factorial(n) < target
        n += 1
    end

    target_digit = Int64[]
    small_position = target
    while n > 0
        n -= 1
        big_position, small_position = find_position(small_position, factorial(n))
        push!(target_digit, big_position)
    end

    #s = 1
    #for k in 1:length(target_digit)
    #    s += (target_digit[k]-1)*factorial(length(target_digit)-k)
    #end

    myorder = collect(0:length(target_digit)-1)
    out = Int64[]
    for k in 1:length(target_digit)
        push!(out, myorder[target_digit[k]])
        deleteat!(myorder, target_digit[k])
    end

    return parse(Int64, reduce(*, [string(x) for x in out]))
end


solution(6) == 210
@time solution(1000000)
