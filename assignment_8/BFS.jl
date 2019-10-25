using DataStructures: Queue, enqueue!, dequeue!, isempty

function bfs!(nodes, start)
  for i = 1:size(nodes, 1)
    nodes[i].color = "white"
    nodes[i].distance = 0
  end

  q = Queue{Node}()
  start.color = "gray"
  if isgoalnode(start)
    return start
  end
  enqueue!(q, start)
  while !isempty(q)
    current = dequeue!(q)
    if isgoalnode(current)
      return current
    end
    for i = 1:size(current.neighbors, 1)
      if current.neighbors[i].color == "white"
        current.neighbors[i].color = "gray";
        current.neighbors[i].distance = current.distance + 1
        current.neighbors[i].predecessor = current;
        enqueue!(q, current.neighbors[i])
      end
    end
   current.color = "black"
  end
  return nothing
end