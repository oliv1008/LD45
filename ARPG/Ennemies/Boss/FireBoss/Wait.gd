extends "res://state/State.gd"

func enter():
	$Timer.start()
	print("On entre dans l'etat Wait")
	owner.get_node('AnimationPlayer').play('Idle')

func exit():
	pass

func _on_animation_finished(anim_name):
	print("On sort de l'etat Wait")
	assert anim_name == 'Idle'
	emit_signal('finished')

func _on_Timer_timeout():
	$Timer.stop()
	owner.get_node('AnimationPlayer').stop()
	emit_signal('finished')
	