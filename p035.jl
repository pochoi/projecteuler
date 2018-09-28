
function allprime(n)
    if n < 2
        return Int64[]
    end

    c = 0
    ps = Int64[]
    for k in [2; 3:2:n]
        flag = true
        for p in ps
            p^2 <= k || break
            (flag = flag && (k % p != 0)) || break
        end
        if flag
            push!(ps, k)
        end
    end
    return ps
end

invdigits(d) = sum([d[k]*10^(k-1) for k=1:length(d)])
function circint(n, raw_shift)
    d = digits(n)
    shift = mod(-raw_shift, length(d))
    return invdigits([d[end-shift+1:end] ; d[1:end-shift]] )
end

function check_good_digits(n)
    d = digits(n)
    flag = (0 ∈ d) || (2 ∈ d) || (4 ∈ d) || (5 ∈ d) || (6 ∈ d) || (8 ∈ d)
    return !flag
end

function solution(n)
    ps = allprime(n)
    ps_by_digits = [Int64[] for i in 1:length(digits(ps[end]))]

    k = 1
    for i in 1:length(ps)
        if ps[i] >= 10^k
            k += 1
        end
        push!(ps_by_digits[k], ps[i])
    end

    c = 0
    for k in 1:length(ps_by_digits)
        ps_sub = ps_by_digits[k]
        for i in 1:length(ps_sub)
            if !check_good_digits(ps_sub[i]) && k > 1
                continue
            end
            circular_prime_flag = true
            for shift in 1:k-1
                if !(circint(ps_sub[i], shift) ∈ ps_sub)
                    circular_prime_flag = false
                    break
                end
            end
            if circular_prime_flag
                c += 1
            end
        end
    end

    return c
end

solution(100) == 13
@time solution(1000000)
