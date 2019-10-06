extends Node2D

var ennemy_number = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	var notificationData = {
		"mobs" : 0
	}
	nc.post_notification("LEVEL_INIT",notificationData)

func on_level_end() :
	var notificationData = {
		"amEarned" : 100,
		"blueprint" : 1
	}
  
	nc.post_notification("LEVEL_END",notificationData)
	
	notificationData = {
		"scene" : "res://ARPG/ARPG_UI/rpgUI.tscn",
		"mainUI" : true
	}
	nc.post_notification("LOAD_LEVEL",notificationData)
	nc.post_notification("LEVEL_END",notificationData)