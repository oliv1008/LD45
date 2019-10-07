extends Button

var newIcon = load("res://assets/images/HUD/CercleViergeFini.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	if !ButtonState.level1 :
		icon = newIcon
		text = "Done"

func _pressed():
	if ButtonState.level1 :
		var notificationData = {
			"scene" : "res://ARPG/Niveaux/Glace/Glace3.tscn",
			"mainUI" : false
			}
		nc.post_notification("LOAD_LEVEL",notificationData)
	ButtonState.level1 = false
