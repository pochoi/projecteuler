
function nbsum(s, p, dim)
    xr = min.(max.((real(p[1]) .+ (-1:1)), 1), dim[1])
    yr = min.(max.((imag(p[1]) .+ (-1:1)), 1), dim[2])
    return sum(s[xr, yr])
end

function solution()
    s = zeros(Int64, 1001, 1001)
    s[501, 501] = 1
    p = [501+1 + 501im, 1 + 0im]
    c = 2
    while c <= 1001^2
        flag = nbsum(s, [1 1; 0 1]*p, (1001,1001)) == 0
        s[real(p[1]), imag(p[1])] = c
        c += 1
        if flag
            p = [1 1; 0 1]*[1 0; 0 -1im]*p
        else
            p = [1 1; 0 1]*p
        end
    end
    a = sum([s[i,i] for i in 1:1001])
    b = sum([s[i,1001-i+1] for i in 1:1001])

    return a+b-1
end

solution()
@time solution()
