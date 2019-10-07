extends KinematicBody2D

var velocity = null
var shooter
var targetPos
export (int) var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	var shooterPos = shooter.position
	if velocity == null:
		targetPos = (targetPos - shooterPos).normalized()
		velocity = targetPos * speed
	else:
		velocity = velocity * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collisionData = move_and_collide(velocity * delta)
	if collisionData != null:
		if collisionData.collider.get_class() == "KinematicBody2D" && collisionData.collider.get_name() == "Player":
			collisionData.collider.get_hit()
			visible = false
			queue_free()
		else:
			queue_free()

func _on_Visibility_sreen_exited():
	queue_free()