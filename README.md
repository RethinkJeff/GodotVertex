# GodotVertex
 A small graph-like implementation for Godot, in GDScript

 The graphs generated are non-directional, and non-weighted.
 
 The only file you have to include is Vertex.gd, the others are included for demonstration only.


# Why?
 Graphs are cool! They're great for tracking relationships between objects. 
 Hopefully, this lets people get some of the cooler features, without necessarily need a whole Graph data structure.

# Usage
 Create a vertex, and then add connections to other vertices!
 We do this by calling Vertex.new(_object, _name). _object is the object the vertex is pointing to, _name is a unique identifier.
 Adding connections is done by calling addConnection(other) on another vertex.

 Deleting a connection is done by calling deleteConnection(other).

 # BFS and DFS
  There's an implementation for both Breadth and Depth First Search. Use them by calling bfs(searchTerm) or dfs(searchTerm)
  They return an array that gives you the steps it took to find the searchTerm, or an empty array if nothing was found.
  This array is origination exclusive by default, but there is a line that you can uncomment to add that to the array.

 # Thanks for watching!
  I hope it's useful for you!
