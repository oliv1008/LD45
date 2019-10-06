extends "res://state/State.gd"

func enter():
	print("Attaque 4!")
	owner.get_node('AnimationPlayer').play('Attack4Test')

func _on_animation_finished(anim_name):
	print("On sort de l'attaque 4")
	assert anim_name == 'Attack4Test'
	emit_signal('finished')
