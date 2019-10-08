extends Button

var newIcon = load("res://assets/images/HUD/CercleBossFini.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	if !ButtonState.boss3 :
		icon = newIcon
		text = "Done"

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed():
	if ButtonState.boss3 :
		var notificationData = {
			"scene" : "res://ARPG/Niveaux/Lave/boss.tscn",
			"mainUI" : false
			}
		nc.post_notification("LOAD_LEVEL",notificationData)
	ButtonState.boss3 = false
