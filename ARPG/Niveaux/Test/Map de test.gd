extends Node2D

func _ready():
	var notificationData = {
		"mobs" : 0
	}
	nc.post_notification("LEVEL_INIT",notificationData)

func _on_Timer_timeout():
	var notificationData = {
		"amEarned" : 100,
		"blueprint" : 1
	}
  
	nc.post_notification("LEVEL_END",notificationData)
	
	notificationData = {
		"scene" : "res://ARPG/ARPG_UI/rpgUI.tscn",
		"mainUI" : true
	}
	PersoGlobal.ammoLeft = PersoGlobal.numberOfAmmoMax
	nc.post_notification("LOAD_LEVEL",notificationData)
	nc.post_notification("LEVEL_END",notificationData)
