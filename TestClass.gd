extends Node
class_name TestClass

#Test class for our vertex class. Our vertex needs a parent object to connect to.

var value
var vert : Vertex 

func _init(_name : String) -> void:
	vert = Vertex.new(self, _name)
