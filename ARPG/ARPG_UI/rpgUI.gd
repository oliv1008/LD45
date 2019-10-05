extends Control

onready var Frontground = $Frontground
onready var CenterContainerIddle = $CenterContainerIddle

func _ready():
	nc.add_observer(self, "DEMO_NOTIFICATION","handleNotification")

func _exit_tree():
	nc.remove_observer(self,"DEMO_NOTIFICATION")
	
func handleNotification(observer,notificationName,notificationData):
	if (notificationData == "allumetoi"):
		visible = true
	if (notificationData == "Create robot"):
		CenterContainerIddle.visible = true

func _on_LetsGo_pressed():
	CenterContainerIddle.visible = false
	Frontground.visible = false
