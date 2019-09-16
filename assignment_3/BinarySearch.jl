function binaryintervalsearch(x,delta, coordinate)
    median = x[floor(Int, size(x, 1)/2), coordinate, 1]
    max = 0
    min = 0
    
    left_cursor = 1
    right_cursor = floor(Int, size(x, 1)/2)


    while left_cursor < right_cursor -1
        if median-delta > x[floor(Int, (right_cursor + left_cursor) / 2), coordinate, 1]
            left_cursor = floor(Int, (right_cursor + left_cursor) / 2)
        else
            right_cursor = floor(Int, (right_cursor + left_cursor) / 2)
        end 
    end

    if median-delta > x[left_cursor, coordinate, 1]
        min = right_cursor
    else
        min = left_cursor
    end

    left_cursor = floor(Int, size(x, 1)/2)
    right_cursor = size(x, 1)

    while left_cursor < right_cursor -1
        if median+delta > x[floor(Int, (right_cursor + left_cursor) / 2), coordinate, 1]
            left_cursor = floor(Int, (right_cursor + left_cursor) / 2)
        else
            right_cursor = floor(Int, (right_cursor + left_cursor) / 2)
        end 
    end

    if median+delta < x[right_cursor, coordinate, 1]
        max = left_cursor
    else
        max = right_cursor
    end
        
    return min, max
end

binaryintervalsearch([1 2; 3 4; 5 6; 7 8; 9 10; 11 12; 13 14; 15 16; 17 18; 19 20], 6, 1)