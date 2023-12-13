
count_rectangle(n, m) = (binomial(n,2)+n)*(binomial(m,2)+m)

function solution(target)
    distance = zeros(Int64, 80, 80)
    for n in 1:80, m in 1:80
        distance[n,m] = count_rectangle(n,m) 
    end
    g = findmin( abs.(distance .- target))[2]

    return g[1]*g[2]
end

solution(2000)
@time solution(2000000)
