extends Node

func _ready():
	pass
   
# create a function to switch between scenes 
func setScene(target, scene):
	target.get_child(0).queue_free()
	var resource = ResourceLoader.load(scene)
	print(scene)
	target.add_child(resource.instance())