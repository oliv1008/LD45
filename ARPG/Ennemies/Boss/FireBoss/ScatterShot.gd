extends "res://state/State.gd"

var fireProjectileScene = load("res://ARPG/Projectiles/FireProjectile/FireProjectile.tscn")
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = owner.get_parent().get_node("Player")

func enter():
	print("ScatterShot")
	owner.get_node('AnimationPlayer').play('Prepare')
	
func update(delta):
	pass

func _on_animation_finished(anim_name):
	if anim_name == "Prepare":
		owner.get_node('AnimationPlayer').play('Attacking')
		scatterShot()

func scatterShot():
	for i in range(0, 10):
		var x = rand_range(player.position.x - 250, player.position.x + 250)
		var y = rand_range(player.position.y - 250, player.position.y + 250)
		var fireProjectileInstance = fireProjectileScene.instance()
		fireProjectileInstance.position = owner.get_node("Position2DShot").global_position
		fireProjectileInstance.shooter = owner 
		fireProjectileInstance.targetPos = Vector2(x, y)
		fireProjectileInstance.speed = rand_range(400, 700)
		owner.get_parent().add_child(fireProjectileInstance)
	emit_signal("finished")