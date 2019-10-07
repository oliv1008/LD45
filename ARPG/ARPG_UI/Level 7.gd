extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	var notificationData = {
		"scene" : "res://ARPG/Niveaux/Glace/Glace4.tscn",
		"mainUI" : false
		}
	nc.post_notification("LOAD_LEVEL",notificationData)

