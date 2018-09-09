
solution(n) = sum(digits(factorial(BigInt(n))))

solution(10) == 27
@time solution(100)
