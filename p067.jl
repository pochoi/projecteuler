
function maxPath(tree)
    if size(tree, 1) == 1
        return tree[1,1], Int64[]

    elseif size(tree, 1) == 2
        if tree[2,1] > tree[2,2]
            return tree[1,1]+tree[2,1], [0]
        else
            return tree[1,1]+tree[2,2], [1]
        end
    else
        n1 = size(tree, 1)
        n2 = size(tree, 2)
        ltree = view(tree, 2:n1, 1:n2-1)
        rtree = view(tree, 2:n1, 2:n2)

        lv, lp = maxPath(ltree)
        rv, rp = maxPath(rtree)

        if lv > rv
            return tree[1,1] + lv, push!(lp, 0)
        else
            return tree[1,1] + rv, push!(rp, 1)
        end
    end
    return 0, Int64[]
end

function sumPath(tree, rvpath)
    p = rvpath[end:-1:1]
    s = tree[1,1]
    j = 1
    for i in 1:length(p)
        j += p[i]
        s += tree[1+i, j]
    end
    return s
end

function maxPathMore(tree, k)
    if k == 1
        v, rvpath = maxPath(tree)
        return v, [0; rvpath[end:-1:1]]
    end 
    i = 1
    j = 1
    out_v = tree[1,1]
    out_path = Int64[0]

    n = size(tree, 1)

    while i <= size(tree, 1)
        v, path = maxPath(tree[i:min((i-1+k), n), j:min((j-1+k), n)])
        out_v += v - tree[i,j]
        append!(out_path, path[end:-1:1])
        i += k-1
        j += sum(path)
    end
    return out_v, out_path
end

# By luck solution
function solution1(tree)
    test_v = Int64[]
    test_path = Array{Int64, 1}[]
    let test_v = test_v, test_path = test_path
    for i in 10:26
        v, path = maxPathMore(tree, i)
        push!(test_v, v)
        push!(test_path, path)
    end
    end

    return maximum(test_v)
end

# By looking at discussion...
function solution2(tree)
    good_sum = copy(tree)
    for i in (size(tree,1)-1):-1:1
    for j in 1:i
        good_sum[i, j] = tree[i, j] + maximum(good_sum[i+1, j:(j+1)])
    end
    end
    return good_sum[1,1]
end

s = read("p067_triangle.txt", String)

tree = zeros(Int64, 100, 100)
let tree = tree, i = 1, j = 1
    n = length(s)
    c = 1
    while c <= n
        if s[c] == '\n'
            c += 1
            i += 1
            j = 1
        elseif s[c] == ' '
            c += 1
        else
            tree[i,j] = parse(Int, s[c.+(0:1)])
            c += 2
            j += 1
        end
    end
end

@time solution1(tree)
@time solution2(tree)
