extends Button

func _pressed():
	var notificationData = {
		"scene" : "res://ARPG/ARPG_UI/rpgUI.tscn",
		"mainUI" : true
	}
	nc.post_notification("LOAD_LEVEL",notificationData)