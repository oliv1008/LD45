
extends Control

func _ready():
	nc.add_observer(self, "LOAD_LEVEL","handleLoad")
	$HBoxContainer/ViewportContainer2/ViewportARPG/RPGScreen.visible = false
	PersoGlobal.viewportARPG = $HBoxContainer/ViewportContainer2/ViewportARPG

func handleLoad(observer,notificationName,notificationData):
	SceneLoader.setScene($HBoxContainer/ViewportContainer2/ViewportARPG, notificationData)

