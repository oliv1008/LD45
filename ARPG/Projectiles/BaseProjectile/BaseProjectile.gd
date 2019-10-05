extends KinematicBody2D

var velocity
var shooter
export (int) var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	var mouse_position = get_viewport().get_mouse_position()
	var shooterPos = shooter.position
	var targetPos = (mouse_position - shooterPos).normalized()
	velocity = targetPos * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(velocity * delta)

func _on_Visibility_sreen_exited():
	queue_free()