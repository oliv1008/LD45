extends "res://state/State.gd"

func enter():
	print("Attaque 1!")
	owner.get_node('AnimationPlayer').play('Attack1Test')

func _on_animation_finished(anim_name):
	print("On sort de l'attaque 1")
	assert anim_name == 'Attack1Test'
	emit_signal('finished')