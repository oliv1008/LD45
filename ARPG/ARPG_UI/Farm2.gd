extends Button

func _ready():
	pass

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed():
	var notificationData = {
		"scene" : "res://ARPG/Niveaux/Glace/Glace1.tscn",
		"mainUI" : false
		}
	nc.post_notification("LOAD_LEVEL",notificationData)
