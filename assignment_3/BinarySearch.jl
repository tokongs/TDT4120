function binaryintervalsearch(x,delta, coordinate)
    divisible_by_two = false
    if size(x, 1) % 2 == 0
        left = x[1:div(size(x, 1), 2)-1, :, :]
        right = x[div(size(x, 1), 2)+2:end, :, :]
        median = (x[div(size(x, 1), 2), coordinate, 1] + x[div(size(x, 1), 2)+1, coordinate, 1]) / 2
    else
        left = x[1:div(size(x, 1), 2), :, :]
        right = x[div(size(x, 1), 2)+2:end, :, :]
        median = x[div(size(x, 1), 2)+1, coordinate, 1]
    end

    maximum = -1
    minimum = -1
    println(left)
    println(right)
    l = 1
    r = size(left, 1)
    m = l + div(r-l, 2)
    while l < r
        m = l + div(r-l, 2)
        if m == l
            break
        end
        if median-delta > left[m, coordinate, 1]
            l = m+1
        else
            r = m
        end 
    end
    if left[r, coordinate, 1] >= median-delta
        minimum = r
    end

    l = 1
    r = size(right, 1)

    while l < r
        m = l + div(r-l, 2)
        if m == l
            break
        end
        println(l, ", ", m, ", ", r)
        if median+delta < right[m, coordinate, 1]
            r = m-1
        else
            l = m
        end 
    end
    println(l, ", ", m, ", ", r)

    if right[l, coordinate, 1] <= median+delta
            maximum = div(size(x, 1), 2) + l
            if size(x, 1) % 2 != 0
                maximum += 1
            end
    end

    return minimum, maximum
end

println(binaryintervalsearch( [1 0; 2 0; 2 0; 3 0; 4 0; 5 0; 5 0], 1,  1))