extends Button

var newIcon = load("res://assets/images/HUD/CercleViergeFini.png")

func _ready():
	if !ButtonState.level3 :
		icon = newIcon
		text = "Done"


func _pressed():
	if ButtonState.level3 :
		var notificationData = {
			"scene" : "res://ARPG/Niveaux/Jungle/level3.tscn",
			"mainUI" : false
			}
		nc.post_notification("LOAD_LEVEL",notificationData)
	ButtonState.level3 = false
