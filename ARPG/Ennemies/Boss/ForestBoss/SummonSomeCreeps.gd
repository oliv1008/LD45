extends "res://state/State.gd"

var trashMob = load("res://ARPG/Ennemies/TrashForest1.tscn")

func enter():
	print("SummonFewCreeps")
	owner.get_node('AnimationPlayer').play('SummonCreeps')
	summonCreeps()
	
func summonCreeps():
	var iteration = randi() % 5 + 1

	for i in range(0, iteration):
		#TODO NE PAS GARDER DES POSITION2D RELATIVE AU BOSS
		var x = randi() % int(owner.get_node("Position2DBottomRight").global_position.x) + int(owner.get_node("Position2DTopLeft").global_position.x)
		var y = randi() % int(owner.get_node("Position2DBottomRight").global_position.y) + int(owner.get_node("Position2DTopLeft").global_position.y)
		var trashInstance = trashMob.instance()
		trashInstance.position = Vector2(x, y)
		owner.get_parent().add_child(trashInstance)

func _on_animation_finished(anim_name):
	print("On sort de SummonSomeCreeps")
	assert anim_name == 'SummonCreeps'
	emit_signal('finished')