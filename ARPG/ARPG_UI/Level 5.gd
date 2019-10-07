extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	if !ButtonState.level5 :
		var colorRectInstance = ColorRect.new()
		colorRectInstance.rect_size = self.rect_size
		colorRectInstance.color = Color(200, 200, 200, 20)
		self.add_child(colorRectInstance)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pressed():
	if ButtonState.level5 :
		var notificationData = {
			"scene" : "res://ARPG/Niveaux/Glace/Glace4.tscn",
			"mainUI" : false
			}
		nc.post_notification("LOAD_LEVEL",notificationData)
	ButtonState.level5 = false
