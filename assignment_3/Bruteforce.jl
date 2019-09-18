function bruteforce(x)
  x_diff = x[1, 1, 1] - x[2, 1, 1]
  y_diff = x[1, 2, 1] - x[2, 2, 1]

  minimum = sqrt(x_diff^2 + y_diff^2)
  for i = 1:size(x, 1)-1
    for j = i+1:size(x, 1)
      x_diff = x[i, 1, 1] - x[j, 1, 1]
      y_diff = x[i, 2, 1] - x[j, 2, 1]
      minimum = min(sqrt(x_diff^2 + y_diff^2), minimum)
    end
  end
  return minimum
end

println(bruteforce([1 1; 10 0; 2 2; 5 5]))