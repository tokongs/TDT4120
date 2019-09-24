function countingsortletters(A,position)
  count = Array{Int}(undef, 27)
  result = Array{String}(undef, size(A, 1))
  for i = 1:size(A, 1)
    value = chartodigit(A[i][position])
    count[value] += 1
  end

  for i = 2:size(count, 1)
    count[i] += count[i-1]
  end

  for i = size(A, 1):-1:1
      next = A[i]
      value = chartodigit(next[position])
      index = count[value]
      count[value] -= 1
      result[index] = next
  end
  
  return result
end



function chartodigit(character)
    return character - '`'
end

println(countingsortletters(["ccc", "cba", "ca", "ab", "abc"], 2))