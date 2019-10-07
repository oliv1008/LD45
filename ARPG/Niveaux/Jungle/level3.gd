extends Node2D

var popUp = load("res://ARPG/PopUpAntimatter.tscn")

func _ready():
	PersoGlobal.ammoLeft = PersoGlobal.numberOfAmmoMax
	PersoGlobal.pv = PersoGlobal.pvMax
	PersoGlobal.ennemiesLeft = 44
	var notificationData = "ennemies"
	nc.post_notification("CHANGE_HUD",notificationData)
	nc.add_observer(self, "POPUP","handleNotification")

func _exit_tree():
	nc.remove_observer(self,"POPUP")
	
func _process(delta):
	if(PersoGlobal.ennemiesLeft == 0):
		on_level_end()

func on_level_end() :
	var notificationData = 1
	nc.post_notification("LEVEL_END",notificationData)
	
	notificationData = {
		"scene" : "res://ARPG/Level_ending.tscn",
		"mainUI" : false
	}
	nc.post_notification("LOAD_LEVEL",notificationData)
	
func handleNotification(observer,notificationName,notificationData):
	if (notificationName == "POPUP"):
		var popUpInstance = popUp.instance()
		popUpInstance.global_position = notificationData[0]
		print("position du popup : ", popUpInstance.position)
		popUpInstance.get_node("HBoxContainer/AMEarned").text = str("+", notificationData[1])
		self.add_child(popUpInstance)