extends Control

onready var Frontground = $Frontground
onready var CenterContainerIddle = $CenterContainerIddle

func _ready():
	nc.add_observer(self, "DEMO_NOTIFICATION","handleNotification")
	nc.add_observer(self, "DISPLAY_MAP","handleDisplay")
	
	MusicPlayer.playSong("Menu", 0.02)

func _exit_tree():
	nc.remove_observer(self,"DEMO_NOTIFICATION")
	nc.remove_observer(self,"DISPLAY_MAP")
	
func handleNotification(observer,notificationName,notificationData):
	if (notificationData == "allumetoi"):
		visible = true
	if (notificationData == "Create robot"):
		CenterContainerIddle.visible = true

func handleDisplay(observer, notificationName, notificationData):
	reveal()

func _on_LetsGo_pressed():
	reveal()

func reveal():
	CenterContainerIddle.visible = false
	Frontground.visible = false