extends "res://state/State.gd"

func enter():
	print("SummonSomeCreeps")
	owner.get_node('AnimationPlayer').play('SummonCreeps')

func _on_animation_finished(anim_name):
	print("On sort de SummonSomeCreeps")
	assert anim_name == 'SummonCreeps'
	emit_signal('finished')
