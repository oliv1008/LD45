extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	PersoGlobal.ammoLeft = PersoGlobal.numberOfAmmoMax
	PersoGlobal.pv = PersoGlobal.pvMax
	PersoGlobal.ennemiesLeft = 0

func _process(delta):
	if(PersoGlobal.ennemiesLeft == 0):
		on_level_end()

func on_level_end() :
	var notificationData = {
		"amEarned" : 100,
		"blueprint" : 1
	}
  
	nc.post_notification("LEVEL_END",notificationData)
	
	notificationData = {
		"scene" : "res://ARPG/Level_ending.tscn",
		"mainUI" : false
	}
	nc.post_notification("LOAD_LEVEL",notificationData)