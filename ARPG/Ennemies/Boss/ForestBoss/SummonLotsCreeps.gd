extends "res://state/State.gd"

func enter():
	print("SummonLotsCreeps")
	owner.get_node('AnimationPlayer').play('SummonCreeps')

func _on_animation_finished(anim_name):
	print("On sort de SummonLotsCreeps")
	assert anim_name == 'SummonCreeps'
	emit_signal('finished')
