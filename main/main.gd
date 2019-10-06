
extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	nc.add_observer(self, "LOAD_LEVEL","handleLoad")
	$HBoxContainer/ViewportContainer2/ViewportARPG/RPGScreen.visible = false

func handleLoad(observer,notificationName,notificationData):
	SceneLoader.setScene($HBoxContainer/ViewportContainer2/ViewportARPG, notificationData)

