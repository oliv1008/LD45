extends Control


func _ready():
	nc.add_observer(self, "DEMO_NOTIFICATION","handleNotification")

func _exit_tree():
	nc.remove_observer(self,"DEMO_NOTIFICATION")
	
func handleNotification(observer,notificationName,notificationData):
	if (notificationData == "allumetoi"):
		visible = true