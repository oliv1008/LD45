extends Node

func _ready():
	pass
   
# create a function to switch between scenes 
func setScene(target_node, scene):
	var child_id
	for child_id in target_node.get_child_count():
		target_node.get_child(child_id).queue_free()
	var resource = ResourceLoader.load(scene)
	print("===============================================> " + scene)
	target_node.add_child(resource.instance())
	print("... loaded")