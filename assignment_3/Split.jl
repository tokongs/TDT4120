function splitintwo(x,y)
  if size(x, 1) % 2 == 0
    x_left = x[1:div(size(x, 1), 2), :, :]
    x_right = x[(div(size(x, 1), 2) + 1):end, :, :]
    y_left = y[1:div(size(x, 1), 2), :, :]
    y_right = y[(div(size(x, 1), 2) + 1):end, :, :]
  else
    x_left = x[1:(div(size(x, 1), 2) +1), :, :]
    x_right = x[(div(size(x, 1), 2) + 2):end, :, :]
    y_left = y[1:(div(size(x, 1), 2) + 1), :, :]
    y_right = y[(div(size(x, 1), 2) + 2):end, :, :]
  end

  return x_left, x_right, y_left, y_right
end

println(splitintwo( [1.0 2.0; 2.0 3.0; 3.0 2.0; 4.0 5.0; 6.0 6.0; 7.0 1.0],  [7.0 1.0; 1.0 2.0; 3.0 2.0; 2.0 3.0; 4.0 5.0; 6.0 6.0]))