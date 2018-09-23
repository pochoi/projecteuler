
isbouncy(n) = !(issorted(digits(n)) || issorted(digits(n), rev = true))

function solution(target_ratio)
    current_ratio = 0.0
    i = 0
    counting = 0
    while current_ratio < target_ratio
        i += 1
        if isbouncy(i)
            counting += 1
        end
        current_ratio = counting/i
    end

    return i    
end

solution(0.5) == 538
@time solution(0.99)
