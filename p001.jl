function solution1(n)
    flag = [(k % 3 == 0) || (k % 5 == 0) for k in 1:n-1]
    return sum((1:n-1)[flag])
end

function solution2(n)
    s = 0
    for k in 1:n-1
        if (k % 3 == 0) || (k % 5 == 0)
            s += k
        end
    end
    return s
end

solution1(1000) == solution2(1000)

@time solution1(1000)
@time solution2(1000)
