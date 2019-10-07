extends "res://state/State.gd"

var numberOfShot = 5
var fireProjectileScene = load("res://ARPG/Projectiles/FireProjectile/FireProjectile.tscn")
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func enter():
	print("StraightShot")
	player = owner.get_parent().get_node("Player")
	owner.get_node('AnimationPlayer').play('Prepare')
	numberOfShot = 5

func _on_animation_finished(anim_name):
	if anim_name == "Prepare":
		$Timer.start()
		owner.get_node('AnimationPlayer').play('Attacking')

func _on_Timer_timeout():
	var fireProjectileInstance = fireProjectileScene.instance()
	fireProjectileInstance.position = owner.get_node("Position2DShot").global_position
	fireProjectileInstance.shooter = owner 
	fireProjectileInstance.targetPos = player.position
	owner.get_parent().add_child(fireProjectileInstance)
	numberOfShot -= 1
	if numberOfShot == 0:
		$Timer.stop()
		emit_signal('finished')
