#Doomsday Algorithm
function anchor_day(year)
    c = div(year, 100)
    return ((5*(c % 4))%7+2)%7
end

function doomsday(year)
    y = year % 100
    a = div(y, 12)
    b = y % 12
    c = div(b, 4)
    d = (a+b+c)%7

    return ((a+b+c)%7 + anchor_day(year))%7
end

function leap_year(year)
    if year % 4 != 0
        return false
    elseif year % 100 != 0
        return true
    elseif year % 400 != 0
        return false
    end

    return true
end

function day_of_the_week(month, day, year)
    if leap_year(year)
        d = [4, 29, 0, 4, 9, 6, 11, 8, 5, 10, 7, 12]
    else
        d = [3, 28, 0, 4, 9, 6, 11, 8, 5, 10, 7, 12]
    end
    return mod((day - d[month]) + doomsday(year), 7)
end

function solution()
    m = [day_of_the_week(k, 1, y) for y in 1901:2000, k in 1:12]
    return sum(m .== 0)
end

solution()
@time solution()
