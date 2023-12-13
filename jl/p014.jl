
function collatz(n)
    k = n
    c = 1
    while k != 1
        if k % 2 == 0
            k = div(k,2)
        else
            k = 3*k +1
        end
        c += 1
    end
    return c
end

function solution(n)
    len = zeros(Int64, n)
    for k in 1:n
        len[k] = collatz(k)
    end
    return findmax(len)[2]
end

solution(10)

@time solution(1000000)
