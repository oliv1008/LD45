extends Tabs

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if ButtonState.level7 && ButtonState.level8 && ButtonState.level9 :
		$Background3/Boss3.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
