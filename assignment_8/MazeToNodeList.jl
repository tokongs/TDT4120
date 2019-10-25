function mazetonodelist(maze)
  nodearray = Array{Node}(undef, size(maze, 1), size(maze, 2))
  
  for i in 1:size(maze, 1)
      for j in 1:size(maze, 2)
          nodearray[i, j] = Node(i, j, Bool(maze[i, j]))
      end
  end

  for i in 1:size(maze, 1)
      for j in 1:size(maze, 2)
          if nodearray[i,j].floor
            if(i > 1)
                   if nodearray[i-1, j].floor
                     push!(nodearray[i,j].neighbors, nodearray[i-1,j])
                  end
              end
                  
            if(j > 1)
                   if nodearray[i,j-1].floor
                     push!(nodearray[i,j].neighbors, nodearray[i,j-1])
                  end
              end
                           
            if(i < size(maze, 1))
                   if nodearray[i+1,j].floor
                     push!(nodearray[i,j].neighbors, nodearray[i+1,j])
                  end
              end
                          
            if(j < size(maze, 2))
                   if nodearray[i,j+1].floor
                     push!(nodearray[i,j].neighbors, nodearray[i,j+1])
                  end
              end                            
          end
      end
  end

  return filter((node) -> node.floor, nodearray)
end