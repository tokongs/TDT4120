

# Getting started

## Insertion sort
#### Pseudo code
```
Insertion-sort(A)
  for j = 2 to A.length
    key = A[j]
    i = j - 1
    while i > 0 and A[i] > key
      A[i+1] = A[i]
      i -= 1
    A[i+1] = key
```
# Growth of functions

## Asymptotic notation

### $\theta$-notation

A function f(n) is $\theta(g(n))$ if there exists constants $c_1$, $c_2$ and so that $c_1g(n) \le f(n) \le c_2g(n)$. 

g(n) is an asymptotically tight bound for f(n)

### O-notation 
O is an asymptotic upper bound, so we only care about the right side of the $\theta$ criteria. 

### $\varOmega$-notation
$\varOmega$ is an asymptotic lower bound, so we only care about the left side of the $\theta$ criteria. 


### o-notation
o is the not asymptotically tight version of O. So instead of filling the criteria for some constant c we need to fill the criteria for all constants. 


### $\omega$
$\omega$ is the same to $\varOmega$ as o is to O. So it is the not asymptotically tight bound. 

## Divide-and-Conquer

1. Divide the problem into subproblems.
2. Solve the subproblems in a recursive manner until they are small enough to do in a straight forward manner. 
3. Combine the solution to the subproblems so that you get the full solution

### Substitution method for solving recurrences

1. Guess the form of the solution
2. Use mathematical induction to find the constants and show that the solution works. 

### Recursion-tree method for solving recurrences


### Mater method for solving recurrences

Solves recurences of the form $T(n) = aT(n/b) + f(n)$ where $a \ge 1$ and $b \gt 1$.

Cases: 
1. $f(n)=O(n^{\log_b a-\epsilon})$
    
    Then $T(n) = \theta(n^{\log_ba})$

2. $f(n) = \theta(n^{\log_b a})$
   
   Then $T(n) = \theta(n^{\log_b a} \lg n)$

3. $f(n) = \varOmega(n^{\log_b a+\epsilon}$ for some constant $\epsilon \gt 0$ and $af(n/b) \le cf(n)$ for some constant $c \lt 1$

    Then $T(n) = \theta(f(n))$

# Sorting and Order Statistics

## Heapsort

Heapsort is a sorting algorithm that runs in $O(n \lg n)$ time. The algorithm sorts in place like insertion sort. 

### The heap data structure.

The heap data structure is an array that we can view as a nearly complete binary tree. We can easly compute where in the array the parent and children of a given element i is:

```
Parent(i):
  return i/2

Left(i)
  return 2i

Ritht(i)
  return 2i+1
```

We have two kinds of binary heaps. Max-heaps and min-heaps. A max heap has a the max-heap property: A[Parent(i)] $\ge$ A[i]. A min-heap works the opposite way.

#### Pseudo code
Max-heapify assumes a max heap A that might not adhere to the max-heap property. The running time of Max-heapify is $O(\lg n)$
```
Max-heapify(A, i)
  l = Left(i)
  r = Right(i)
  if l <= A.heap-size and A[l] > A[i]
    largest = l
  else
    largest = i
  if r <= A.heap-size and A[r] > A[largest]
    largest = r
  if largest != i
    exchange A[i] with A[largest]
    Max-Heapify(A, largest)
```

The running time of Build-Max-Heap is $O(n)$
```
Build-Max-Heap(A)
  A.heap-size = A.length
    for i = A.length/2 downto 1
      Max-Heapify(A, i)
```

```
Heap-Extract-Max(A)
  if A.heap-size < 1
    error "heap underflow"
  max = A[1]
  A[1] = A[A.heap-size]
  A.heap-size -= 1
  Max-Heapify(A, 1)
  return max
```
```
Heap-Increase-Key(A, i, key)
  if key < A[i]
    error "new key is smaller thatn current key"
  A[i] = key
  while i > 1 and A[Parent(i)] < A[i]
    exchange A[i] with A[Parent(i)]
    i = Parent(i)
```
```
Max-Heap-Insert(A, key)
  A.heap-size += 1
  A[A.heap-size] = -infinity
  Heap-Increase-Key(A, A.heap-size,key)
```

### Pseudo code for heapsort
The algorithm start by calling Build-Max-Heap to build a max heap of the input. 
It 
```
Heapsort(A)
  Build-Max-Heap(A)
  for i = A.length downto 2
    exchange A[1] with A[i]
    A.heap-size -= 1
    Max-Heapify(A, 1)
```

### Priority Queue
Priority qeueus are a way to store elements in a queue based on a key value. The underlying data structure is a heap. 
## Quicksort

Quicksort sorts and array of n numbers in $\theta(n^2)$ worst case time. 

The expected runnining time is $\theta(n \lg n)$. But it has a worst case running time of $\theta(n^2)$ 

Quick sort partitions the array into to parts A[p ... q+1] and A[q+1 ... p]
A[q] is bigger than or equal to alle elements of the first partition and less than or equal to all elements of the last parition. Each partiton is the sorted by a recursive calls. 


#### Pseudo code

This algorithm rearanges an Array A in place. 
it selected A[r] as the pivot element and puts all larger number on the right side of this element and all smaller numbers on the left side of this element.
```
Partition(A, p, r)
  x = A[r]
  i = p - 1
  for j = p to r -1
    if A[j] <= x
      i = i+1
      exchange A[i] with A[j]
  exchange A[i+1] with A[r]
  return i+1 
```

```
Quicksort(A, p, r)
  if p < r
    q = Partition(A, p, r)
    Quicksort(A, p, q-1)
    Quicksort(A, q+1, r)
```

## Sorting in linear time

The earlier sorting algorithms have compared the elemtns to eachother and it is not possible to run any such algorithm better than $\varOmega(n lg n)$. It is however possible to sort in linear time if you dont compare. Among these algorithms are counting sort, radix sort and bucket sort.

### Counting sort

Counting sort sorts a list of integers in the range 0 to k. 
When k = O(n) the sort runs in $\theta(n)$ time. 

The algorithm counts the number of elements that is smaller in value to each input element.
It then inserts the elemnts from the back, counting down how many elements it should place.

An element C[i] in C contains the number of elements less than or equal to i in A.

B contains the sorted array when the algorithm is finished. 

#### Pseudo code

```
Counting-Sort(A, B, k)
  let C[0..k] = new array
  for i = 0 to k
    C[i] = 0
  for j = 1 to A.length
    C[A[j]] = A[A[j]] + 1
  for i = 1 to k
    C[i] = C[i] + C[i-1]
  for j = A.length downto 1
    B[C[A[j]]] = A[j]
    C[A[j]] = C[A[j]] -1
```

### Radix sort
Radix sort sorts number on their least significat digit first. 
Given n d-digit number where each digit can have k posiible values, the running time is $\theta(d(n+k))$

#### Pseudo code 
```
Radix-Sort(A, d)
  for i = 1 to d
    use a stable sort to sort array A on digit i
```

### Bucket sort
We assume that the input is drawn form a uniform distribution of number with value in the range [0, 1). Then it has an average-case running time of O(n). We create n lists(buckets) and insert the values into the right bucket. We then sort each bucket independently and put them together in order. 

#### Pseudo code
```6
Bucker-Sort(A)
  let B[0...n-1] = new Array
  n = A.length
  for i = 0 to n-1
    B[i] = new List
  for i = 1 to n
    insert A[i] into list B[nA[i]]
  for i = 0 to n-1
    sort list B[i] with insertion sort
  concatenate the lists B[0], B[1], ..., B[n-1] in order.
```

# Medians and Order Statistics

The selction problem is formally defined as follows:

**Input** A set A of n (distinct) numbers and an integer i with $1 \le i \le n$
**Output** The element x $\in$ A that is larger than exactly i-1 other elements of A
## Randomized select
This is an algorithm for selecting the ith smallest element of an array A[p ... r].
The worst-case running time is $\theta(n^2)$, but the expected time is $\theta(n)$
#### Pseudo code
```
Randomized-Select(A, p, r, i)
  if p == r
    return A[p]
  q = Randomized-Partition(A, p, r)
  k = q - p +1
  if i == k
    return A[q]
  else if i < k
    return Randomized-Select(A, p, q - 1, i)
  else
    return Randomized-Select(A, q + 1, r, i - k)
```

# Data Strutures
## Elementary data structures
### Stack
A stack is a last in first out data structure 
#### Pseudo code. 
```
Stack-Empty(S)
  if S.top == 0
    return true
  else
    return false
```

```
Push(S, x)
  S.top = S.top +1
  S[s.top] = x
```

```
Pop(S)
  if Stack-Empty(S)
    error "underflow"
  else S.top = S.top - 1
    return S[S.top + 1]
```

### Queue
A queue is a first in first out data structure. 
#### Pseudo code

```
Enqueue(Q, x)
  Q[Q.tail] = x
  if Q.tail == Q.length
    Q.tail = 1
  else 
  Q.tail += 1
```

```
Dequeue(Q)
  x = Q[Q.head]
  if Q.head == Q.length
    Q.head = 1
  else
    Q.head += 1
  return x
```

### Linked lists

A linked list is a data structure where every element has a pointer to the next element. (And the previous element in a doubly linked list). 

It is possible to implement a linked list we multiple arrays, one key array, one next array and one prev array(for doubly linked lists)

#### Pseudo code

```
List-Search(L, k)
  x = L.head
  while x != nil and x.key != k
    x = x.next
  return x
```

```
List-Insert(L, x)
  x.next = L.head
  if L.head != nil
    L.head.prev = x
  L.head = x
  x.prev = nil
```

```
List-Delete(L, x)
  if x.prev != nil
    x.prev.next = x.next
  else
    L.head = x.next
  if x.next != nil
    x.next.prev = x.prev
```
## Hash table

A hash table is an effective way to implement a dictionary. 
When we have a big Universe of keys, but not too many keys we can use a hash function to reduce the size needed from our underlying array. 

Two keys can be hashed to the same value, a "collision". A method to resolve this is chaining, to place all elements in the same hash slot in a linked list. 

### Hash functions
$h(k) = \lfloor km \rfloor$, where $0 \le k \le 1$ is a simple uniform hashing algorithm.

#### Division method
$h(k) k \bmod m$, where k is the key and m is the number of slots you have.
#### Multiplication method
$h(k) = \lfloor m(kA \bmod 1)\rfloor$, where A is a constant in the range (0, 1).

#### Pseudo code 

Hash the key with i until we find an open spot or we reach the end of the array. 
```
Hash-Insert(T, k)
  i = 0
  do
    j = hash(k, i)
    if T[j] == nil
      T[j] = k
      return j
    else
      i += 1
  while i != m
  error "hash table overflow"
```
```
Hash-Search(T, k)
  i = 0
  do
    j = h(k, i)
    if T[j] == k
      return j
    i += 1
  while T [j] != nil and i != m
```

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

# Dynamic programming
Dynamic programming solves  problems by combining the solutions of subproblems. We typically apply dynamic programming to optimization problems with the following properties.
  * Optimal substructure
  
    The optimal solution to the problem contains the optimal solution to the  subproblems

  * Overlapping subproblems
  
    This means that sub problems shares subproblems

We solve each subproblem once and then save the result instead of doing it again later. 


To solve a problem with dynamic programming:

1. Characterize the structure of an optimal solution
2. Rescursively define the value of an optimal solution
3. Compute the value of an optimal solution, typically in a bottom-up fashion
4. Construct an optimal solution form computed information.

## Rod cutting 
The rod cutting problem is that given a rod of length n inches and a table of prices $p_i$  for i = 1, 2,..., n. Determine the maximum revenue obtainable by cutting and selling the rod. 

#### Pseudo code
A recursive method for computing the problem 
```
Cut-Rod(p, n)
  if n == 0
    return 0
  q = -infinity
  for i = 1 to n
    q = max(q, p[i] + Cut-Rod(p, n-i))
  return q
```

Here is how to do it with dunamic programming

```
Bottom-Up-Cut-Rod(p, n)
  let r = new Array of size n
  r[0] = 0
  for j = 1 to n
    q = -infinity
    for i = 1 to j
      q = max(q, p[i] + r[j - i])
    r[j] = q
  return r[n]
```

## Longest common subsequence

#### Pseudo code
```
LCS-Length(X, Y)
  m = X.length
  n = Y.length
  let b = new Array[m, n]
  let c = new Array[m, n]

  for i = 1 to m
    c[i, 0] = 0
  for j = 0 to n
    c[0, j] = 0
  for i = 1 to m
    for j = 1 to n
      if x[i] == y[i]
        c[i, j] = c[i -1, j -1] + 1
        b[i, j] = "upleft"
      elseif c[i - 1, j] >= c[i, j -1]
        c[i, j] = c[i - 1, j]
        b[i, j] = "up"
      else
        c[i, h] = c[i, j-1]
        b[i, j] = "left"
  return b, c
```
# Greedy algorithms

A greedy algorithm always makes the locally optimal choice. Greedy algorithms don't always yield the globally optimal result, but for many problems they do. 

For a problem to be solvable with a greedy algorithm it needs two key properties:
* Greedy-choice property:
  
  The optimal choice at any given step is not dependant on any of the future steps.

* Optimal substructure:
  
  The optimal solution to the problem contains the optimal solution to the subproblems




## Actitivity selection problem
You hav a set of activities with diferent starting and finishing times. You want to go to as many as possible.
#### Pseduo code
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
## Knapsack problem

We have two different versions of the knapasck problem , 0-1 knapsack problem and fractional knapsack problem.  A thief is robbing a store and want to steal as much value as possible. Each item has a worth and a weight. In the 0-1 problem the theif must take the item or not, but in the fractional problem the thief can take fractions of an item. 

Greedy programming works on the fractional probelm but not 0-1.

### Huffman coding

Huffman coding is a way to compress data. We usa a table giving how often a character's frequency to make an optimal way to represent it. 

To encode the character we build a full binary tree. With the least used characters futher down on the tree.

#### Pseduo code

We store the string in a min priority queue based on frequency. Then we loop through n -1 times and combind the two nodes with the lowest frequency.

The running time is O(n lg n)

```
Huffman(C)
  n = |C|
  Q = C
  for i = 1 to n -1
   z = new node
   z.left = x = Extract-Min(Q)
   z.right = y = Extract-Min(Q)
   Insert(Q, z)
return Extract-Min(Q)
```

# Amortized analysis

Amortized is analysis is different from average-case analysis in that probablility is not involved.

## Dynamic tables

Sometimes we don't know how much space we need. Dynamic tables is good for this because the amortized cost of insertion and deletion is  O(1). The acctual cost is much greater the few times it happens that we need to increase the size of the table. 

#### Pseduo code

```
Table-Insert(T, x)
  if T.size == 0
    allocate T.table with 1 slot
    T.size = 1
  if T.num == T.size
    allocate new-table with 2*T.size slots
    insert all items in T.table into new-table
    free T.table
    T.table = new-table
    T.size = 2 * T.size
  insert x into T.table
  T.num = T.num + 1
```

# Data structures for disjoint sets
This data structure needs to perform two operations, finding which unique set an element belongs to and uniting two sets.


## Disjoint-set operations

A disjoint-set data structure maintains a collection of disjoint dynamic sets. We represent each set by a representativ, an element from the set. 

Make-Set(x) creater a nerw set from elelment x
Union(x, y) Fuses the two sets that x, and y belong to
Find-Set(x) Find the set that x belongs to. 

## Disjoint-set forest

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

# Elementary Graph Algorithms

## Representation of graphs
There are two standard ways to represent a graph. As a collection of adjecency lists or as an adjacency matrix. 

A sparse graph is when E is much less than V^2

A dens graph is when E is close to V^2

## BFS

Breadth-first search visists each node's neighbors before it continues to work on the next node in line. We can use BFS to compute the distance from the source to each reacable vertex. 

To keep track of where we are in the search, we can use color. All vertices start out as white. If a vertex is black, all it's neighbors are black or gray. If a vertex is gray neighbors can be any color. 


The total running time of BFS is O(V + E)
#### Pseduo code
```
BFS(G, s)
  for each vertex u in G.V except s
    u.color = white
    u.d = infinite
    u.p = nil
  s.color = gray
  s.d = 0
  s.p = nil
  Q = Ø
  Enqueu(Q, s)
  while Q != Ø
    u = Dequeue(Q)
    for each v in G.adj[u]
      if v.color == white
        v.color = gray
        v.d = u.d +1
        v.p = u
        enqueue(Q, v)
    u.color = black
```

## DFS

Depth-first serach vistss a vertex's first child, then the child's first child and so first, and so on and so forth. 

### Classification of edges
1. Tree edges are edges in the depth-first forest. Edge (u, v) is a tree edge if v was discovered by exploring (u, v)
2. Back edges are those edges (u, v) connecting a vertex u to an ancestor v in a depth-first tree. We consider solf-loops to be back edges. 
3. Forward edges are those nontree edges (u, v) connection a vertex u to a descendant v in a depth-first tree
4. Cross edges are all other edges. 

Color to indicate edge type
* white indicated a tree edge
* gray indicates a back edge
* balck indicates a forward or a cross edge

#### Pseduo code
```
DFS(G)
  for each vertex u in G.v
    u.color = white
    u.p = nil
  time = 0
  for each vertex u in G.V
    if u.color = white
      DFS-Visit(G, u)
```
```
DFS-Visit(G, u)
  time = time +1
  u.d = time
  u.color = gray
  for each v in G.adj[u]
    if v.color = white
      v.p = u
      DFS-Visit(G, v)
  u.color = black
  time = time +1
  u.f = time
```

## Topological sort


# Minimum spanning tree

## Kruskals algorithm

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

## Prims algorithm

Prims algorithms finda a minimum spanning tree by starting at a arbitrary node v and always adding the lighest edge that connects the resulting set A to an isolated node. 

This is a greedy algorithm because it always makes the locally optimal choice. 

### Pseudo code
We use a mmin-priority qeueu Q that stores nodes not already added to the tree prioritized on v.key.

Every iteration takes out the smallest element from Q then updates it's neighbors keys and predecessor. 

```
MST-Prim(G, w, r)
  for each u in G.V
    u.key = infinity
    u.pi = nil
  r.key = 0
  Q = G.V
  while Q != Ø
    u = Extract-min(Q)
    for each v in G.Adj(u)
      if v in Q and w(u, v) < key
      v.pi = u
      v.key = w(u, v)
```
## Single-Source Shortest Paths

Single-Source Shortest path is about finding the lowest weighted simple 6path from a given source v to each other vertex u. We typically rely on optimal substructure as a shortest path from v to u will probably contain other shortest path. 

#### Relaxation

To relax an edge mean to check if we can cut down the the distance to v and updating it's distance if we can. 

##### Pseudo code

Check if the distance to u + the weight of (u, v) is smaller than the distance to v. If it is, update the distance to v and it's predecessor 

```
Relax(u, v, w)
  if v.d > u.d + w(i, v)
    v.d = u.d + w(u, v)
    v.pi = u
```

## All-Pairs shortest paths

### Floyd-Warshall

Floyd-Warshal uses DP to find the shortest path between all pairs of nodes in a directed graph. 
The algorithm can deal with negative-weighted edges, but not negative-weighted cycles.

The algorithm ha sa running time of $\theta(n^3)$.

#### Pseudo code
The algorithm takes in a graph an adjecency matrix and return a matrix D of shortes path weights. 
```
Floyd-Warshall(W)
  n = W.rows
  D[0] = W
  for k = 1 to n
    let D = new n*n matrix
    for i = 1 to n
      for j = 1 to n
        D[i][j] = min(D[i][j], D[i][k] + D[k][j])
  return D[n]
```
## Maximum flow

Maximum flow handles the question of how much of something can flow through a network of nodes connected by edges. Each edge can have a non-negative capacity. And if the set of Edges E contains (u, v) it cannot contain (v, u).

There are two special vertices in the network. The source s and the sink t. The flow starts at s and ends at t. 

Flow is conserved through nodes. There has to be an equal amount of flow into a node and out of the same node. The source and sinks are an excpetion to this rule. 

### Residual networks

The redsidual network $G_f$ consists of edges that represent hoe we can change the flow on edges of G. 
The edges of G that have not filled their capacities are in $G_f$

To represent a decrease in flow f(u,v), we place an edge (v,u) into $G_f$ with capacity = f(u, v)

$G_f$ consists of edges (u, v) from G with leftover capacity and edges (v, u) in oposite direction. The capacities of these edges are c(u, v) - f (u, v) and f(u, v) respectively. 

# NP-Completeness

Most problems in this curriculum can be solved in polynomial-time. Which means that there exists an algorithm for which a given input of size $n$ can produces the right output in $O(n^k)$ for some constant k.

There exists problems that cannot be solved in polynomial time, The "Halting problem" for example.

Some P vs NP problems: 
* Shortes(P) vs longest(NPC) simple paths.
* Euler tour(P) vs hamiltionian cucle(NPC)
* 2-CNF satifiability(P) vs 3-CNF satisfiability(NPC)

### P
The set of problems that can be solved in polynomial time. P is a subset of NP because if a problem can be solved in polynomial time, this algorithm can be used to verify a solution. 
### NP
The set of problems for which we can verify that a solution is valid in polynomial time.

### NPC
The set of problems that are in NP and also as hard as any problem in NP. If any one problem in NPC can be solved in polynomial time, all problems in NP has a polynomial time algorithm. 

### Showing NP-completeness
#### Decision problems vs optimization problems

A solution to a optimization problem has a value. I a desicion problem the solution is either "yes" or "no". NP-complete problems are confined to the realm of decisionm problems.  

We can translate a optimization problem to a desicion problem. Which means that if a optimization problem is "easy", the corresponding decision problem is easy too. Likewise, if the desicion problem is "hard", the corresponding optimization problem is "hard"

#### Reductions

If we have a "easy" problem A and we have an algorithm to reduce a problem instance A to problem instance of B, we can prove that B is also "easy". This also works the other way. if A is "hard" and the exists a polynomial time reduction algorithm that can convert an instance of A to an instance of B, we can prove that B is also "hard".

### Polynomial time


#### Abstract problems

An abstract problem Q is a binary relation of the set I of problem instances and a set S of problem solutions. 

An abstract decision problem is a relation from I to the solution set {0, 1}, yes or no. 

#### Encodings

To solve an abstract problem we need to encode the solution set S. A problem whose instance set I is the set of binary strings is a concrete problem. A concrete problem is polynomial-time solvable if there exists an algorithm to solve it in time $O(n^k)$ for some constant k. 

We can use encodings to map abstract problems to concrete problems. 

#### A formal-language framework

An algorithm A accepts a string x $\in$ {0, 1}$^*$, if the output A(x) is 1.
An algorithm A rejects a string x if A(x) = 0.
This means that an algorithm A accepts the languaga L = {x $\in$ {0, 1}$^*$ : A(x) = 1}

A language L is decided in polynomial time by an algorithm if there exists a constant k such that for a string x of length n the algorithm correctly decides wether x $\in$ {0, 1}$^*$ in time O($n^k$).

### Polynomial-time verification
If we have a problem instance i and a "certificate" c, a problem P in NP has an algorithm which can check the certificate against the instance in polynomial time. 



### NP-completeness and Reducibility
A language L is NP-complete if it's in NP and is polynomial-time reducible to any other language in NP.

When we have already proved at least one problem to be NP-complete, we can use that to prove other problems to be NP-complete.

### Method of proving that a Language is NP-complete

1. Prove L $\in$ NP
2. Select a known NP-complete language L'
3. Decribe an algorithm that computes a function mapping every string x in L' to a string f(x) in L
4. Prove that the function satisfies x in L' if and only if f(x) in L for all x. 
5. Prove that the algorithm computing f runs in polynomial time. 

### Some NP-complete problems

* Forumla stifiablility
* 3-CNF satisfiability
* The clique problem
* The vertex-cover problem
* The hamiltonian-cycle problem
* The traveling-salesman problem
* The subset-sum problem



