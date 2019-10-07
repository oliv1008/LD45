extends Tabs

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if ButtonState.level4 && ButtonState.level5 && ButtonState.level6 :
		$Background2/Boss2.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
