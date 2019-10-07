extends Node2D

var popUp = load("res://ARPG/PopUpAntimatter.tscn")
var mob1 = load("res://ARPG/Ennemies/Lava/TrashLava.tscn")
var mob2 = load("res://ARPG/Ennemies/Lava/MiniBossLava.tscn")
var trash = 50
var miniboss = 20
func _ready():
	$Timer1.start()
	$Timer2.start()
	PersoGlobal.ennemiesLeft = 70
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

func _on_Timer1_timeout():
	if (trash != 0):
		$Path2D/PathFollow2D.set_offset(randi())
		var spawn = mob1.instance()
		add_child(spawn)
		spawn.position = $Path2D/PathFollow2D.position
		trash = trash-1


func _on_Timer2_timeout():
	if (miniboss != 0):
		$Path2D/PathFollow2D.set_offset(randi())
		var spawn = mob2.instance()
		add_child(spawn)
		spawn.position = $Path2D/PathFollow2D.position
		miniboss = miniboss-1
