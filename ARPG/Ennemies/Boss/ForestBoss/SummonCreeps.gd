extends "res://state/State.gd"

func enter():
	print("Attaque 2!")
	owner.get_node('AnimationPlayer').play('Attack2Test')

func _on_animation_finished(anim_name):
	print("On sort de l'attaque 2")
	assert anim_name == 'Attack2Test'
	emit_signal('finished')