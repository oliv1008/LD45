extends Button

var newIcon = load("res://assets/images/HUD/CercleViergeFini.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	if !ButtonState.level6 :
		icon = newIcon
		text = "Done"

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed():
	if ButtonState.level6 :
		var notificationData = {
			"scene" : "res://ARPG/Niveaux/Glace/Glace5.tscn",
			"mainUI" : false
			}
		nc.post_notification("LOAD_LEVEL",notificationData)

