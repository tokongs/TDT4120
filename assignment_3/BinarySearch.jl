function binaryintervalsearch(x,delta, coordinate)
    median = x[size(x, 1), coordinate, :]
    if size(x, 1)%2 == 0
        median_index = floor(Int, size(x, 1)/2)
    else
        median_index = floor(Int, size(x, 1)/2)+1
    interval_start = 1
    interval_end = size(x, 1)

    if x[interval_start, coordinate, :] >= median-delta && x[interval_end, coordinate, :] >= median_delta]
        return 0, 0
    end


    left_cursor = floor(Int, median_index/2)
    right_cursor = 3*floor(Int, median_index/2)

    if median-delta > x[left_cursor, coordinate, :]
        interval_start = left_cursor + 1
        left_cursor = left_cursor - interval_start
    else
        left_cursor
    end
    if median + delta < x[right_cursor, coordinate, :]
        interval_end = right_cursor - 1
        right_cursor = interval_end - right_cursor
    end

    x, y = binaryintervalsearch(x[interval_start:interval_end, : , :], delta, coordinate)
    x = x
    return inter
end