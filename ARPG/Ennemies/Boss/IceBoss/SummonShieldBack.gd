extends "res://state/State.gd"

var shieldBackScene = load("res://ARPG/Ennemies/Boss/IceBoss/Icicle/ShieldBack.tscn")

func enter():
	print("SummonShieldBack!")
	owner.get_node('AnimationPlayer').play('ShieldBack')

func _on_animation_finished(anim_name):
	print("On sort de SummonShieldBack")
	assert anim_name == 'ShieldBack'
	emit_signal('finished')
	
func summonShield():
	var shieldBackInstance = shieldBackScene.instance()
	owner.add_child(shieldBackInstance)