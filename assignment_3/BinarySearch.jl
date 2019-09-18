function binaryintervalsearch(x,delta, coordinate)
    median = x[div(size(x, 1), 2), coordinate, 1] + 1
    divisible_by_two = false
    if size(x, 1) % 2 == 0
        median = (x[div(size(x, 1), 2), coordinate, 1] + x[div(size(x, 1), 2)+1, coordinate, 1]) / 2
        divisible_by_two = true
    end
    maximum = -1
    minimum = -1
    
    l = 1
    r = div(size(x, 1), 2) -1
        
    while l <= r
        m = l + div(r-l, 2)
        if median-delta >= x[m, coordinate, 1]
            l = m+1
        else
            r = m-1
        end 
    end
    if min(l, r) >= 1 && x[min(l, r), coordinate, 1] >= median-delta 
        minimum = min(l, r)
    elseif  x[max(l, r), coordinate, 1] >= median-delta
        minimum = max(l, r)
    end
    
    l = div(size(x, 1), 2) + 1
    if divisible_by_two
        l += 1
    end
    r = size(x, 1)
    while l <= r
        m = l + div(r-l, 2)
        if median+delta >= x[m, coordinate, 1]
            l = m+1
        else
            r = m-1
        end 
    end

    if max(l, r) <= size(x, 1) && x[max(l, r), coordinate, 1] <= median+delta
        maximum = max(l, r)
    elseif x[min(l, r), coordinate, 1] <= median+delta
        maximum = min(l, r)
    end

    return minimum, maximum
end

println(binaryintervalsearch([1 0; 2 0; 2 0; 3 0; 4 0; 5 0; 5 0] ,  1, 1))