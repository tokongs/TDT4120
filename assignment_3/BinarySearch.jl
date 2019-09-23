function binaryintervalsearch(x,delta, coordinate)
    minimum = maximum = -1
    left_r = div(size(x, 1), 2)
    left_l = 1
    right_l = div(size(x, 1), 2)+1
    right_r = size(x, 1)
    median = (x[div(size(x, 1), 2), coordinate, 1] + x[div(size(x, 1), 2)+1, coordinate, 1]) / 2
    if size(x, 1) % 2 != 0
        minimum = maximum = div(size(x, 1), 2) + 1
        median = x[div(size(x, 1), 2)+1, coordinate, 1]
    end

    while left_r - left_l > 1
        middle = left_l + div(left_r - left_l, 2)
        if median-delta <= x[middle, coordinate, 1]
            left_r = middle
        else
            left_l = middle
        end
    end
    if x[left_l, coordinate, 1] >= median-delta
        minimum = left_l
    elseif x[left_r, coordinate, 1] >= median-delta
        minimum = left_r
    end

    while right_r - right_l > 1
        middle = right_l + div(right_r - right_l, 2)
        if median-delta <= x[middle, coordinate, 1]
            right_r = middle
        else
            right_l = middle
        end
    end
    if x[right_r, coordinate, 1] <= median+delta
        maximum = right_r
    elseif x[right_l, coordinate, 1] <= median+delta
        maximum = right_l
    end
    return minimum, maximum
end

println(binaryintervalsearch([1 2; 2 3; 3 0; 4 0; 5 1], 1.5, 1))
println(binaryintervalsearch([1 2; 2 0; 3 3; 4 4], 0.25, 1))
println(binaryintervalsearch([1 0; 2 0; 2 0; 3 0; 4 0; 5 0; 5 0], 1, 1))
println(binaryintervalsearch([1 0; 2 0; 3 0], 0.25, 1))
