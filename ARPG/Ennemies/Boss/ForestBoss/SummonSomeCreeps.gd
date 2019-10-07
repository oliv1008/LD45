extends "res://state/State.gd"

func enter():
	print("Attaque 3!")
	owner.get_node('AnimationPlayer').play('Attack3Test')

func _on_animation_finished(anim_name):
	print("On sort de l'attaque 3")
	assert anim_name == 'Attack3Test'
	emit_signal('finished')
