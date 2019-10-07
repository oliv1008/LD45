extends TabContainer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	if !ButtonState.tab2 :
		set_tab_disabled(2, true)
	else :
		set_tab_disabled(2, false)
	if !ButtonState.tab3 :
		set_tab_disabled(3, true)
	else :
		set_tab_disabled(3, false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
