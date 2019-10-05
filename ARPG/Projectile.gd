extends KinematicBody2D

var screen_size = get_viewport_rect().size
var velocity
var shooter
export var speed = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	var mouse_position = get_viewport().get_mouse_position()
	var shooterPos = shooter.position
	var targetPos = (mouse_position - shooterPos).normalized()
	velocity = targetPos * speed
	
func init(shooterParam):
	shooter = shooterParam

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(velocity * delta)
	

func _on_Visibility_sreen_exited():
	queue_free()