extends CanvasLayer

onready var Heart1 = $Control/VUDHContainer/HBoxContainer/Heart1
onready var Heart2 = $Control/VUDHContainer/HBoxContainer/Heart2
onready var Heart3 = $Control/VUDHContainer/HBoxContainer/Heart3
onready var Heart4 = $Control/VUDHContainer/HBoxContainer/Heart4
onready var Heart5 = $Control/VUDHContainer/HBoxContainer/Heart5
onready var EnnemiesLeft = $Control/VUDHContainer/EnnemiesLeft
onready var AmmoLeft = $Control/VUDHContainer/AmmoLeft

# Called when the node enters the scene tree for the first time.
func _ready():
	nc.add_observer(self, "CHANGE_HUD","handleNotification")
	EnnemiesLeft.text = str(PersoGlobal.ennemiesLeft, " ennemies left")
	AmmoLeft.text = str(PersoGlobal.ammoLeft, " ammo left")
	if (PersoGlobal.pvMax == 3):
		Heart1.visible = true
		Heart2.visible = true
		Heart3.visible = true
		Heart4.visible = false
		Heart5.visible = false
	if (PersoGlobal.pvMax == 4):
		Heart1.visible = true
		Heart2.visible = true
		Heart3.visible = true
		Heart4.visible = true
		Heart5.visible = false
	if (PersoGlobal.pvMax == 5):
		Heart1.visible = true
		Heart2.visible = true
		Heart3.visible = true
		Heart4.visible = true
		Heart5.visible = true

func _process(delta):
	pass

func _exit_tree():
	nc.remove_observer(self,"CHANGE_HUD")
	
func handleNotification(observer,notificationName,notificationData):
	if (notificationData == "pv"):
		if (PersoGlobal.pv == 1):
			Heart1.visible = true
			Heart2.visible = false
			Heart3.visible = false
			Heart4.visible = false
			Heart5.visible = false
		if (PersoGlobal.pv == 2):
			Heart1.visible = true
			Heart2.visible = true
			Heart3.visible = false
			Heart4.visible = false
			Heart5.visible = false
		if (PersoGlobal.pv == 3):
			Heart1.visible = true
			Heart2.visible = true
			Heart3.visible = true
			Heart4.visible = false
			Heart5.visible = false
		if (PersoGlobal.pv == 4):
			Heart1.visible = true
			Heart2.visible = true
			Heart3.visible = true
			Heart4.visible = true
			Heart5.visible = false
		if (PersoGlobal.pv == 5):
			Heart1.visible = true
			Heart2.visible = true
			Heart3.visible = true
			Heart4.visible = true
			Heart5.visible = true
		if (PersoGlobal.pv <= 0):
			Heart1.visible = false
			Heart2.visible = false
			Heart3.visible = false
			Heart4.visible = false
			Heart5.visible = false
			
	if (notificationData == "ennemies"):
		EnnemiesLeft.text = str(PersoGlobal.ennemiesLeft, " ennemies left")
		if (PersoGlobal.ennemiesLeft <= 0):
			print("c'est la fin")
			var notificationFin = "FIN"
			nc.post_notification("FIN", notificationData)
	if (notificationData == "ammo"):
		AmmoLeft.text = str(PersoGlobal.ammoLeft, " ammo left")