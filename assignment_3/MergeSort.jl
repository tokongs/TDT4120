#x og y er to sorterte arrays, coordinate angir koordinat akse
function mergearrays(x,y,coordinate)
    x_index = 1
    y_index = 1
    result = []
    if x[x_index, coordinate, :] <= y[y_index, coordinate, :]
        result = x[x_index:x_index, :, :]
        x_index += 1
    else
        result = y[y_index:y_index, :, :]
        y_index += 1
    end

    while x_index <= size(x, 1) || y_index <= size(y, 1)
        if x_index > size(x, 1)
            result = [result; y[y_index:end, :, :]]
            break
        elseif y_index > size(y, 1)
            result = [result; x[x_index:end, :, :]]
            break
        end
        if x[x_index, coordinate, :] <= y[y_index, coordinate, :]
            result = [result; x[x_index:x_index, :, :]]
            x_index += 1
        else
            result = [result; y[y_index:y_index, :, :]]
            y_index += 1
        end
    end
    return result
end

#x usortert array, coordinate angir koordinat akse vi skal sortere langs
function mergesort(x, coordinate)
    
    if size(x, 1) == 1
        return x
    end
    left = mergesort(x[1:div(size(x, 1),2), :, :], coordinate)
    right = mergesort(x[div(size(x, 1),2)+1:end, :, :], coordinate)
    return mergearrays(left, right, coordinate)
end

println(mergesort([1.0 0.0; 2.0 0.0; 3.0 0.0],1))