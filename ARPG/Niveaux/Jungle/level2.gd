extends Node2D

var popUp = load("res://ARPG/PopUpAntimatter.tscn")

func _ready():
	PersoGlobal.ennemiesLeft = 38
	var notificationData = "ennemies"
	nc.post_notification("CHANGE_HUD",notificationData)
	nc.add_observer(self, "POPUP","handleNotification")
	nc.add_observer(self, "FIN", "handleNotification")
	notificationData = {
		"mobs" : 0
	}
	nc.post_notification("LEVEL_INIT",notificationData)

func _exit_tree():
	nc.remove_observer(self,"POPUP")
	
func handleNotification(observer,notificationName,notificationData):
	if (notificationName == "POPUP"):
		var popUpInstance = popUp.instance()
		popUpInstance.global_position = notificationData[0]
		print("position du popup : ", popUpInstance.position)
		popUpInstance.get_node("HBoxContainer/AMEarned").text = str("+", notificationData[1])
		self.add_child(popUpInstance)
	if (notificationName == "FIN"):
		print("du coup j'arrive là")
		var notificationDat = {
		"amEarned" : 100,
		"blueprint" : 1
		}
		nc.post_notification("LEVEL_END",notificationDat)
		
		notificationDat = {
			"scene" : "res://ARPG/ARPG_UI/rpgUI.tscn",
			"mainUI" : true
		}
		PersoGlobal.ammoLeft = PersoGlobal.numberOfAmmoMax
		nc.post_notification("LOAD_LEVEL",notificationDat)
		nc.post_notification("LEVEL_END",notificationDat)