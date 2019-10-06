extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var notificationData = {
		"amEarned" : 100,
		"blueprint" : 1
	}
	nc.post_notification("LEVEL_END",notificationData)
	
	notificationData = "res://ARPG/ARPG_UI/rpgUI.tscn"
	nc.post_notification("LOAD_LEVEL",notificationData)
