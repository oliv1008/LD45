extends "res://state/State.gd"

var numberOfShot = 5
var fireProjectileScene = load("res://ARPG/Projectiles/FireProjectile/FireProjectile.tscn")
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = owner.get_parent().get_node("Player")

func enter():
	print("CardinalShot")
	owner.get_node('AnimationPlayer').play('Prepare')
	numberOfShot = 5

func _on_animation_finished(anim_name):
	if anim_name == "Prepare":
		$Timer1.start()
		owner.get_node('AnimationPlayer').play('Attacking')

func _on_Timer1_timeout():
	var fireProjectileInstanceNord = fireProjectileScene.instance()
	fireProjectileInstanceNord.position = owner.get_node("Position2DShot").global_position
	fireProjectileInstanceNord.shooter = owner 
	fireProjectileInstanceNord.velocity = Vector2(0, -1)
	
	var fireProjectileInstanceEst = fireProjectileScene.instance()
	fireProjectileInstanceEst.position = owner.get_node("Position2DShot").global_position
	fireProjectileInstanceEst.shooter = owner 
	fireProjectileInstanceEst.velocity = Vector2(1, 0)
	
	var fireProjectileInstanceSud = fireProjectileScene.instance()
	fireProjectileInstanceSud.position = owner.get_node("Position2DShot").global_position
	fireProjectileInstanceSud.shooter = owner 
	fireProjectileInstanceSud.velocity = Vector2(0, 1)
	
	var fireProjectileInstanceOuest = fireProjectileScene.instance()
	fireProjectileInstanceOuest.position = owner.get_node("Position2DShot").global_position
	fireProjectileInstanceOuest.shooter = owner 
	fireProjectileInstanceOuest.velocity = Vector2(-1, 0)
		
	owner.get_parent().add_child(fireProjectileInstanceNord)
	owner.get_parent().add_child(fireProjectileInstanceEst)
	owner.get_parent().add_child(fireProjectileInstanceSud)
	owner.get_parent().add_child(fireProjectileInstanceOuest)
	
	numberOfShot -= 1
	if numberOfShot == 0:
		$Timer1.stop()
		$Timer2.start()
		numberOfShot = 5
		
func _on_Timer2_timeout():
	var fireProjectileInstanceNordEst = fireProjectileScene.instance()
	fireProjectileInstanceNordEst.position = owner.get_node("Position2DShot").global_position
	fireProjectileInstanceNordEst.shooter = owner 
	fireProjectileInstanceNordEst.velocity = Vector2(1, -1).normalized()
	
	var fireProjectileInstanceSudEst = fireProjectileScene.instance()
	fireProjectileInstanceSudEst.position = owner.get_node("Position2DShot").global_position
	fireProjectileInstanceSudEst.shooter = owner 
	fireProjectileInstanceSudEst.velocity = Vector2(1, 1).normalized()
		
	var fireProjectileInstanceSudOuest = fireProjectileScene.instance()
	fireProjectileInstanceSudOuest.position = owner.get_node("Position2DShot").global_position
	fireProjectileInstanceSudOuest.shooter = owner 
	fireProjectileInstanceSudOuest.velocity = Vector2(-1, 1).normalized()
		
	var fireProjectileInstanceNordOuest = fireProjectileScene.instance()
	fireProjectileInstanceNordOuest.position = owner.get_node("Position2DShot").global_position
	fireProjectileInstanceNordOuest.shooter = owner 
	fireProjectileInstanceNordOuest.velocity = Vector2(-1, -1).normalized()
		
	owner.get_parent().add_child(fireProjectileInstanceNordEst)
	owner.get_parent().add_child(fireProjectileInstanceSudEst)
	owner.get_parent().add_child(fireProjectileInstanceSudOuest)
	owner.get_parent().add_child(fireProjectileInstanceNordOuest)
	
	numberOfShot -= 1
	if numberOfShot == 0:
		$Timer2.stop()
		emit_signal("finished")