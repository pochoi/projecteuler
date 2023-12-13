#Problem 31
function ways(amount, coins)
    memo = zeros(Int64, amount+1)
    memo[1] = 1
    for i in 1:length(coins)
        for j in coins[i]:amount
            memo[j+1] = memo[j+1] + memo[j+1 - coins[i]]
        end
    end
    return memo[amount+1]
end

ways(5, 1:4) == 6
@time ways(100, 1:99)
