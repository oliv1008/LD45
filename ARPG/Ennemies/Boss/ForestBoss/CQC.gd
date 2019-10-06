extends "res://state/State.gd"

func enter():
	print("CQC!")
	owner.get_node('AnimationPlayer').play('CQC')

func _on_animation_finished(anim_name):
	print("On sort de CQC")
	assert anim_name == 'CQC'
	emit_signal('finished')