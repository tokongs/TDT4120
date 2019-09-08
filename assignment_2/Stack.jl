

function reverseandlimit(array, maxnumber)
    stack = []
    while length(array) != 0
        x = pop!(array)
        x = x > maxnumber ? maxnumber : x
        push!(stack, x)
    end

    return stack
end

println(reverseandlimit([10,5,16,0], 8))

