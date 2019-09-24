function countingsortlength(A)
  result = Array{String}(undef, size(A, 1))
  count_length = 1
  for i = 1:size(A, 1)
    count_length = max(count_length, length(A[i])+1)
  end
  count = Array{Int}(undef, count_length)
  for i = 1:size(A, 1)
    count[length(A[i])+1] += 1
  end

  for i = 2:size(count, 1)
    count[i] += count[i-1]
  end


  for i = size(result, 1):-1:1
    result[count[length(A[i])+1]] = A[i]
    count[length(A[i])+1]-=1
  end

  return result
end

println(countingsortlength(["bbbb", "aa", "aaaa", "", "ccc"]))