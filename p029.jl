
function solution(n)
    length(unique([BigInt(a)^b for a in 2:n, b in 2:n]))
end

solution(5) == 15
@time solution(100)
