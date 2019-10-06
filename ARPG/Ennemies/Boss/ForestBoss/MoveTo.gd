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

func update(delta):
	velocity = (target_position - start_position).normalized()
	owner.move_and_slide(velocity * delta * speed)
	if owner.get_slide_count() > 0:
		emit_signal('finished')
	elif owner.global_position.distance_to(target_position) < 3:
		emit_signal('finished')

func calculate_new_random_target_position():
	var x = randi() % 1921
	var y = randi() % 1081
	return Vector2(x, owner.position.y)
	
func exit():
	owner.get_node('AnimationPlayer').play('Idle')
	print("On sort de l'etat MoveTo")
