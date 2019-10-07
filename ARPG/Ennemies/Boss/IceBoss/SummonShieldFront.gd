extends "res://state/State.gd"

var shieldFrontScene = load("res://ARPG/Ennemies/Boss/IceBoss/Icicle/ShieldFront.tscn")

func enter():
	print("SummonShieldFront!")
	owner.get_node('AnimationPlayer').play('ShieldFront')

func _on_animation_finished(anim_name):
	print("On sort de SummonShieldFront")
	assert anim_name == 'ShieldFront'
	emit_signal('finished')
	
func summonShield():
	var shieldFrontInstance = shieldFrontScene.instance()
	shieldFrontInstance.position = owner.get_node("Position2DShieldFront").position
	owner.add_child(shieldFrontInstance)
