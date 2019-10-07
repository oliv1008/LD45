extends "res://state/State.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func enter():
	owner.get_node('AnimationPlayer').play('Die')

func _on_animation_finished(anim_name):
	queue_free()