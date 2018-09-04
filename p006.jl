solution(n) = sum(1:n)^2 - sum((1:n).^2)

solution(10) == 2640
@time solution(100)
