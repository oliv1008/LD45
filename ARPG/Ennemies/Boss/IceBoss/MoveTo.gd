extends "res://state/State.gd"

var target_position = Vector2()
var start_position = Vector2()
var velocity = Vector2()
export (int) var speed = 20000

func enter():
	owner.get_node('AnimationPlayer').play('Walk')
	print("On entre dans l'etat MoveTo")
	start_position = owner.position
	target_position = calculate_new_random_target_position()
	owner.look_at(target_position)
	owner.rotation_degrees += -90

func update(delta):
	velocity = (target_position - start_position).normalized()
	owner.move_and_slide(velocity * delta * speed)
	if owner.get_slide_count() > 0:
		emit_signal('finished')
	elif owner.global_position.distance_to(target_position) < 3:
		emit_signal('finished')

func calculate_new_random_target_position():
	var positionTopLeft = owner.get_parent().get_node("Position2DTopLeft")
	var positionBottomRight = owner.get_parent().get_node("Position2DBottomRight")
	var x = (randi() % (int(positionBottomRight.position.x) + 1 - int(positionTopLeft.position.x))) + int(positionTopLeft.position.x)
	var y = (randi() % (int(positionBottomRight.position.y) + 1 - int(positionTopLeft.position.y))) + int(positionTopLeft.position.y)
	return Vector2(x, y)
	
func exit():
	owner.get_node('AnimationPlayer').play('Idle')
	print("On sort de l'etat MoveTo")
