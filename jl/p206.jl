
function check_good(n)
    d = digits(n, pad = 19)
    if d[1] == 0 && all(d[3:2:19] .== 9:-1:1)
        return true
    else
        return false
    end
end

function solution()
    out = Int64[]
    #for n in 138902660:-10:101010100 
    for n in 101010100:10:138902660
        test1 = (n+3)*10
        test2 = (n+7)*10
        if check_good(test1^2)
            println(test1^2)
            return test1
        elseif check_good(test2^2)
            println(test2^2)
            return test2
        end
    end
    return 0
end

solution()
@time solution()
