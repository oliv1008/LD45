extends Node2D

var popUp = load("res://ARPG/PopUpAntimatter.tscn")

func _ready():
	nc.add_observer(self, "POPUP","handleNotification")
	var notificationData = {
		"mobs" : 0
	}
	nc.post_notification("LEVEL_INIT",notificationData)

func _exit_tree():
	nc.remove_observer(self,"POPUP")
	
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
	
func handleNotification(observer,notificationName,notificationData):
	if (notificationName == "POPUP"):
		var popUpInstance = popUp.instance()
		popUpInstance.global_position = notificationData[0]
		print("position du popup : ", popUpInstance.position)
		popUpInstance.get_node("HBoxContainer/AMEarned").text = str("+", notificationData[1])
		self.add_child(popUpInstance)
