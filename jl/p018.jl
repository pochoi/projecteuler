
function maxPath(tree)
    if size(tree, 1) == 1
        return tree[1]
    else
        ltree = tree[2:end, 1:end-1]
        rtree = tree[2:end, 2:end]

        lv = maxPath(ltree)
        rv = maxPath(rtree)

        if lv > rv
            return tree[1,1] + lv
        else
            return tree[1,1] + rv
        end
    end
    return 0
end

tree = zeros(Int64, 4,4)
tree[1,1] = 3
tree[2,1:2] = [7, 4]
tree[3,1:3] = [2, 4, 6]
tree[4,1:4] = [8, 5, 9, 3]

maxPath(tree) == 23

s = """
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
"""

tree = zeros(Int64, 15, 15)
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

@time maxPath(tree)
