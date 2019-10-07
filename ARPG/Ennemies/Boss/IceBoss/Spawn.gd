extends "res://state/State.gd"

func enter():
	print("On entre dans l'etat Spawn")
	owner.set_invincible(true)
	owner.get_node('AnimationPlayer').play('Spawn')

func exit():
	owner.set_invincible(false)

func _on_animation_finished(anim_name):
	print("On sort de l'etat Spawn")
	assert anim_name == 'Spawn'
	emit_signal('finished')

