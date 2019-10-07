extends "res://state/State.gd"

func enter():
	print("BreathAttack!")
	var target_position = owner.get_parent().get_node("Player").position
	owner.look_at(target_position)
	owner.rotation_degrees += -90
	owner.get_node('AnimationPlayer').play('BreathAttack')

func _on_animation_finished(anim_name):
	print("On sort de BreathAttack")
	assert anim_name == 'BreathAttack'
	emit_signal('finished')
