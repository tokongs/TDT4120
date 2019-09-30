function dnasimilarity(s1, s2)
    result = 0
    for i = 1:length(s1)
        if(s1[i] == s2[i])
           result += 1 
        end
    end
    return result
end