extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed():
	var notificationData = {
		"scene" : "res://ARPG/Niveaux/Glace/Glace3.tscn",
		"mainUI" : false
		}
	nc.post_notification("LOAD_LEVEL",notificationData)
