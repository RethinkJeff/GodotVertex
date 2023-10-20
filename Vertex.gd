class_name Vertex

#a unique identifier. It needs to be something that can be passed as a key
#to a dictionary
var name : String
#list of other vertices we're connected to
var edges = {}
#point to an object
var object : Object

#Constructor
#Input: reference object, and name
#Recommended use is that you pass self along here, in order to
#ensure that you're not creating multiple graphs, but if you've got a manager
#for something, you can also pass things by reference here.
#name _must be unique_
func _init(_object: Object, _name : String):
	self.name = _name
	self.object = _object

func addConnection(other : Vertex) -> void:
	#vertices should be unique
	assert(!edges.has(other.name))
	assert(!other.edges.has(self.name))
	edges[other.name] = other
	other.edges[self.name] = self

func deleteConnection(other : Vertex) -> void:
	#don't delete something that isn't there!
	assert(edges.has(other.name))
	assert(other.edges.has(self.name))
	edges.erase(other.name)
	other.edges.erase(self.name)
	
func printEdges() -> void:
	for each in edges:
		print(each)

#data checking function. 
#Intended to be overrided. A default to just use the name.
#This function _should absolutely not contain a for loop_
#This function _should absolutely not go anywhere outside of the object it's attached to_
#Ideally you'd check against a Set for a value, but GDScript doesn't have native Sets.
#Checking against dictionaries that are only actually keys is a fine, if hacky workaround
func checkVertex(check) -> bool:
	return check == name	

#input is untyped so that we can pass whatever we want to this function,
#and still do custom data checking	
#Breadth First Search
#Mostly good for finding closest relationships
#I'm happy to add more short information about BFS here, but a longer 
#explanation has been covered extensively by youtube.
#Input: a thing to search for
#Output: an array of Vertices that matches the criteria.
#Used Functions: checkVertex
func bfs(what) -> Array[Vertex]:
	var visited = {}
	var current : Vertex
	var queue : Array[Vertex] = []
	
	var returnArray : Array[Vertex] = []
	visited[name] = "Start"
	queue.push_back(self)

	while(!queue.is_empty()):
		#vist the vertex
		current = queue.pop_front()
		
		#If we find what we're looking for
		if(current.checkVertex(what)):
			#make an array of vertices based on the way we got here
			while(str(visited[current.name]) != "Start"):
				returnArray.push_back(current)
				current = visited[current.name]
			
			#uncomment this if you want to have the start node be a part of your path
			#returnArray.push_back(self)
			
			returnArray.reverse()
			return returnArray
			
		for key in current.edges:
			#right now, due to the way we track pathing, this means we will 
			#always toggle everything in a row with a find as having been visited
			#even if we find it earlier in that row.
			if(!visited.has(key)):
				visited[key] = current
				queue.push_back(current.edges[key]) 
		
	#return an empty array
	return returnArray

#input is untyped so that we can pass whatever we want to this function,
#and still do custom data checking	
#Depth First Search
#Currently is right side instead of left side, which shouldn't matter
#but in case you've got a specific use case where you need to change that
#you can change all of the references to push/pop back to push/pop front.
#due to the way I'm using arrays as lists here though, it will incur a small
#performance hit.
#Input: a thing to search for
#Output: an array of Vertices that matches the criteria.
#Used Functions: checkVertex
func dfs(what) -> Array[Vertex]:
	var visited = {}
	var current : Vertex
	var stack : Array[Vertex] = []
	
	var returnArray : Array[Vertex] = []
	visited[self.name] = "Start"
	stack.push_back(self)
	while(!stack.is_empty()):		
		#vist the vertex
		current = stack.pop_back()
		
		#If we find what we're looking for
		if(current.checkVertex(what)):
			#make an array of vertices based on the way we got here
			while(str(visited[current.name]) != "Start"):
				returnArray.push_back(current)
				current = visited[current.name]
			
			#uncomment this if you want to have the start node be a part of your path
			#returnArray.push_back(self)
			
			returnArray.reverse()
			return returnArray
			
		for key in current.edges:
			#right now, due to the way we track pathing, this means we will 
			#always toggle everything in a row with a find as having been visited
			#even if we find it earlier in that row.
			if(!visited.has(key)):
				visited[key] = current
				stack.push_back(current.edges[key]) 

	#return an empty array
	return returnArray
	
#How many edges out?
func getDegrees() -> int:
	return edges.size()
