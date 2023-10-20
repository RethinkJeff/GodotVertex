extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	#make our graph
	#TestClass object with vertices attached (handled by constructor in TestClass
	var test1 = TestClass.new("a")
	var test2 = TestClass.new("b")
	var test3 = TestClass.new("c")
	var test4 = TestClass.new("d")
	var test5 = TestClass.new("e")
	var test6 = TestClass.new("f")
	
	#Add connections to our vertices
	test1.vert.addConnection(test2.vert)
	test1.vert.addConnection(test3.vert)
	test2.vert.addConnection(test4.vert)
	test2.vert.addConnection(test5.vert) #commenting this line out makes for a better DFS example
	test3.vert.addConnection(test5.vert)
	test4.vert.addConnection(test6.vert)
	test4.vert.addConnection(test5.vert)
	test5.vert.addConnection(test6.vert)
	
	#Breadth and Depth first search tests.
	var _BFS = test1.vert.bfs("f") 
	var _DFS = test2.vert.dfs("c")
	
	#whichever one you want to test, have testVar point to that.
	var testVar = _BFS
	
	#for each in testVar:
	#	print(each.name)
	
	print(test1.vert.getDegrees())
