extends "res://state/State.gd"

var IcicleScene = preload("res://ARPG/Ennemies/Boss/IceBoss/Icicle/Icicle.tscn")

func enter():
	print("IcicleAttack!")
	owner.get_node('AnimationPlayer').play('IcicleAttack')

func _on_animation_finished(anim_name):
	print("On sort de IcicleAttack")
	assert anim_name == 'IcicleAttack'
	emit_signal('finished')
	
func target_player():
	var playerPos = owner.get_parent().get_node("Player")
	var positionTopLeft = Vector2(playerPos.position.x - 70, playerPos.position.y - 70)
	var positionBottomRight = Vector2(playerPos.position.x + 70, playerPos.position.y + 70)
	var iteration = (randi() % 3) + 1
	for i in range(0, iteration):
		var x = (randi() % (int(positionBottomRight.x) + 1 - int(positionTopLeft.x))) + int(positionTopLeft.x)
		var y = (randi() % (int(positionBottomRight.y) + 1 - int(positionTopLeft.y))) + int(positionTopLeft.y)
		var icicleInstance = IcicleScene.instance()
		icicleInstance.position = Vector2(x, y)
		owner.get_parent().add_child(icicleInstance)
		