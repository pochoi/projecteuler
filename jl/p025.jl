
function fibonacci!(f::AbstractVector{T} , n) where T <: Integer
    if n <= 0
        return f
    end
    lenf = length(f)
    append!(f, zeros(T, n))
    if lenf == 0
        if n > 2
            f[1] = one(T)
            f[2] = one(T)
            for k in 3:n
                f[lenf+k] = f[lenf+k-1] + f[lenf+k-2]
            end
        else
            f[1:n] = [one(T), one(T)][1:n]
        end
    elseif lenf == 1
        f[2] = f[1]
        for k in 2:n
            f[lenf+k] = f[lenf+k-1] + f[lenf+k-2]
        end
    else
        for k in 1:n
            f[lenf+k] = f[lenf+k-1] + f[lenf+k-2]
        end
    end
    return f
end
fibonacci(::Type{T}, n) where {T <: Integer} = fibonacci!(T[] , n)
fibonacci(n) = fibonacci(Int64, n)

function solution(kmax)
    len = 10
    f = fibonacci(BigInt, len)

    while f[end] < kmax
        f = fibonacci!(f, len)
    end

    for k in length(f):-1:1
        if f[k] < kmax
            return k+1
        end
    end
    return 0
end

solution(BigInt(10)^9)

@time solution(BigInt(10)^999)
