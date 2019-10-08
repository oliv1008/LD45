extends Button

var newIcon = load("res://assets/images/HUD/CercleViergeFini.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	if !ButtonState.level8 :
		icon = newIcon
		text = "Done"



	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed():
	if ButtonState.level8 :
		var notificationData = {
			"scene" : "res://ARPG/Niveaux/Lave/level2.tscn",
			"mainUI" : false
			}
		nc.post_notification("LOAD_LEVEL",notificationData)
	ButtonState.level8 = false
