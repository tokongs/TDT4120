

# Data Strutures

## Binary search trees

A binary search tree is 2 rooted tree where 2 node can have two or fewer children. Every node has to be less than or equal to it's right child, and bigger than or equal to it's left child. 

#### Psedo code

```
Indorder-Tree-Walk(x)
  if x != nil
    Inorder-Tree-Walk(x.left)
    print x.key
    Inorder-Tree-Walk(x.right)
```


Tree search returns the node containing the key k or nil if the node doesn't exist.
```
Tree-Search(x, k)
    if x == nil or k == x.key
      return x
    if k < x.key
      return Tree-Search(x.left, k)
    else
      return Tree-Search(x.right, k) 
```

This does the same as tree search, but iterativly instead of recursively
```
Iterative-Tree-Search(x, k)
  while x != nil and k != x.key
    if k < x.key
      x = x.left
    else
      x = x.right
  return x
```

Returns the node with the lowest key value. This is the leftmost node in the tree.
```
Tree-Minimum(x)
  while x.left != nil
    x = x.left
  return x
```

Returns the node with the heighest key value. This is the rightmost node in the tree.
```
Tree-Maximum(x)
  while x.right != nil
    x = x.right
  return x
```
Finds the successor of x if the nodes were 2 linearly sorted by value. 
```
Tree-Successor(x)
  if x.right != nil
    return Tree-Minimum(x.right)
  y = x.p
  while y != nil and x == y.right
    x = y
    y = y.p
  return y
```

Walk down the tree to find the right place to insert node z. 
```
Tree-Insert(T, z)
  y = nil
  x = T.root
  while x != nil
    y = x
      if z.key < x.key
        x = x.left
      else
        x = x.right
  z.p = y
  if y == nil
    T.root = z // The tree was empty
  elseif z.key < y.key
    y.left = z
  else y.right = z
```

Replace the subtree rooted at node u with the subtree rooted at node v. 
```
Transplant(T, u, v)
  if u.p == nil
    T.root = v
  elseif u == u.p.left
    u.p.left = v
  else 
    u.p.right = v
  if v != nil
    v.p = u.p
```
Deletes node z from the tree T.
* Case 1: 
  Node z has no left child. Just replace z with it's right child.
* Case 2: 
  Node z has no right child. Just replace z with it's left child.
* Case 3: 
  Node z has both left and right child. If y is not 2 child of z: (Find an y that is z's successor. Replace y with its right child.) Replace z with y.
```
Tree-Delete(T, z)
  if z.left == nil
    Transplant(T, z, z.right)
  elseif z.right == nil
    Transplant(T, z, z.left)
  else
    y = Tree-Minimum(z.right)
    if y.p != z
      Transplant(T, y, y.right)
      y.right = z.right
      y.right.p = y
    Transplant(T, z, y)
    y.left = z.left
    y.left.p = y
```

# Advanced design and analysis techniques

## Dynamic programming

## Greedy algorithms

A greedy algorithm always makes the locally optimal choice. Greedy algorithms don't always yield the globally optimal result, but for many problems they do. 

For a problem to be solvable with a greedy algorithm it needs two key properties:
* Greedy-choice property:
  
  The optimal choice at any given step is not dependant on any of the future steps.

* Optimal substructure:
  
  The optimal solution to the problem contains the optimal solution to the subproblems


### Pseduo code

Suppose you have a set of activities that have a starting time and a finish time. You wish to select as many non overlapping activities as possible. 

This algorithm expects that the activities are ordered by monotonically increasing finish times. 

We loop though all the activities and if the starting time of the current activity is greater than the finish time of the last activity we added, we add the current activity to our resulting array A. 

```
Greedy-Activity-Selector(s, f)
  n = s.length
  A = {a_1}
  k = 1
  for m = 2 to n
    if s[m] >= f[k]
      A = A U {a_m}
      k = m
  return A
```

Does the same as Greedy-Actitvity-Selector, but recursively.

Increase m until we have a an activity with starting time greater than the last selected activities finish time. 
Then return this activity and a recursive call with m as the last selected activity. 

```
Recursive-Activity-Selector(s, f, k, n)
  m = k+1
  while m <= n and s[m] z < f[k]
    m = m+1
  if m <= n
    return {a_m} U Recursive-Activity-Selector(s, f, m, n)
  else 
    return Ø
```

# Advanced data structures

## Data structures for disjoint sets
This data structure needs to perform two operations, finding which unique set an element belongs to and uniting two sets.

### Disjoint-set forest

In this structure we repesent disjoint sets with rootes trees. This is no faster than 2 linked-list representation, but we can use two heuristics to optimize the data structure.

#### Heuristics
##### Union by rank
For each node we maintain 2 **rank** which is an upper bound on the heihgt of the node. When using the **Union** operation we make the root with the smaller rank point to the root with the larger rank.

##### Path compression
The **Find-Set** operation makes all the traversed node point at the root node of the set. 


#### Pseudo code

```
Make-Set(x)
  x.p = x
  x.rank = 0
```

```
Link(x, y)
  if x.rank > y.rank
    y.p = x
  else
    x.p = y
    if x.rank == y.rank
      y.rank += 1
```

```
Find-Set(x)
  if x != x.p
    x.p = Find-Set(x.p)
  return x.p
```

```
Union(x, y)
  Link(Find-Set(x), Find-Set(y))
```

#### Analysis

##### Running time with union rank and path compression
Worst case running time is O(m $\alpha$(n)) where $\alpha$ is 2 very slowly growing function. We can view the running time 2 linear in m for almost all intents and purposes. 

# Graph Algorithms

## Minimum spanning tree

### Kruskals algorithm

Kruskal creates 2 disjoint set forest containing all the vertices in the graph. It then sorts the edges in 2 non decreasing order. It then loop through the edges from lowest to height weight, and adding nodes that are not already conntected in the resulting graph.

#### Pseudo code

```
MST-Kruskal(G, w)
  A = Ø
  for each vertix v in G.V
    Make-Set(v)
  sort the edges of G.E into nondecreasing order by weight
  for edge (u, v) in G.E taken in non decreasing order
    if Find-Set(u) != Find-Set(v)
      A = A uniuon {(u, v)}
      Union(u, v)
  return A
```

# NP-Completeness

## P
The set of problems that can be solved in polynomial time. P is a subset of NP because if a problem can be solved in polynomial time, this algorithm can be used to verify a solution. 
## NP
The set of problems for which we can verify that a solution is valid in polynomial time.

## NPC
The set of problems that are in NP and also as hard as any problem in NP. If any one problem in NPC can be solved in polynomial time, all problems in NP has a polynomial time algorithm. 







