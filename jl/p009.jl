
function solution(n)
    for a in 1:(n-2)
        for b in (a+1):(n-1)
            c = n - (a+b)
            if a^2 + b^2 == c^2
                return a*b*c
            end
        end
    end
    return 0
end

solution(1000)

