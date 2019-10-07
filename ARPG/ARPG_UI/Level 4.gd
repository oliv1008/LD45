extends Button

var active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if !active :
		get_button_icon().draw(get_id(), self.position, Color(125, 125, 125))

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed():
	if active :
		var notificationData = {
			"scene" : "res://ARPG/Niveaux/Glace/Glace3.tscn",
			"mainUI" : false
			}
		nc.post_notification("LOAD_LEVEL",notificationData)
	active = false
