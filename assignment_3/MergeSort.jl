#x og y er to sorterte arrays, coordinate angir koordinat akse
function mergearrays(x,y,coordinate)
    x_index = y_index = 1
    result = [x; y]

    x = [x; [Inf Inf]]
    y = [y; [Inf Inf]]
    index = 1
    println(x[x_index, 1])
    while x_index < size(x, 1) || y_index < size(y, 1)
        if x[x_index, coordinate] <= y[y_index, coordinate]
            result[index, :] = x[x_index, :]
            index+=1
            x_index+=1
            
        else
            result[index, :] = y[y_index, :]
            index+=1
            y_index+=1
        end
    end

    return result
end

#x usortert array, coordinate angir koordinat akse vi skal sortere langs
function mergesort(x, coordinate)
    
    if size(x, 1) == 1
        return x
    end
    if size(x, 1) % 2 == 0
       left = mergesort(x[1:div(size(x, 1),2), :], coordinate)
       right = mergesort(x[div(size(x, 1),2)+1:end, :], coordinate)
    else
       left = mergesort(x[1:div(size(x, 1),2)+1, :], coordinate)
       right = mergesort(x[div(size(x, 1),2)+2:end, :], coordinate)
    end
    return mergearrays(left, right, coordinate)
end

println(mergesort([1 2; 4 6; 2 1],1))
println(mergesort([1 2; 4 5; 2 1],2))
println(mergesort([1.0 0.0; 2.0 0.0; 3.0 0.0], 1))