extends Node2D

var popUp = load("res://ARPG/PopUpAntimatter.tscn")
var mob = load("res://ARPG/Ennemies/Forest/TrashForest1.tscn")
var spawnNumber = 20

func _ready():
	MusicPlayer.playSong("Monde1", 0.02)
	$Timer.start()
	PersoGlobal.ennemiesLeft = 20
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
	
func _process(delta):
	if(PersoGlobal.ennemiesLeft == 0):
		on_level_end()
		
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
			"scene" : "res://ARPG/Farm_ending.tscn",
			"mainUI" : true
		}
		PersoGlobal.ammoLeft = PersoGlobal.numberOfAmmoMax
		nc.post_notification("LOAD_LEVEL",notificationDat)
		nc.post_notification("LEVEL_END",notificationDat)
func on_level_end() :
	var notificationData = 1
	nc.post_notification("LEVEL_END",notificationData)
	
	notificationData = {
		"scene" : "res://ARPG/Level_ending.tscn",
		"mainUI" : false
	}
	nc.post_notification("LOAD_LEVEL",notificationData)
	
func _on_Timer_timeout():
	if (spawnNumber != 0):
		$Path2D/PathFollow2D.set_offset(randi())
		var spawn = mob.instance()
		add_child(spawn)
		spawn.position = $Path2D/PathFollow2D.position
		spawnNumber = spawnNumber-1
	var notificationData = {
		"scene" : "res://ARPG/Level_ending.tscn",
		"mainUI" : false
	}
	nc.post_notification("LOAD_LEVEL",notificationData)
