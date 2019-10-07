extends "res://state/State.gd"

var fireProjectileScene = load("res://ARPG/Projectiles/FireProjectile/FireProjectile.tscn")
var player
var isAttacking = false
var timeElapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	player = owner.get_parent().get_node("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func enter():
	timeElapsed = 0
	print("Spiralshot")
	owner.get_node('AnimationPlayer').play('Prepare')
	
func update(delta):
	if isAttacking:
		timeElapsed += delta
	if timeElapsed >= 3.6:
		$Timer.stop()
		emit_signal("finished")
		isAttacking = false

func _on_animation_finished(anim_name):
	if anim_name == "Prepare":
		$Timer.start()
		isAttacking = true
		owner.get_node('AnimationPlayer').play('Attacking')

func _on_Timer_timeout():
	var x = cos(timeElapsed * 2)
	var y = sin(timeElapsed * 2)
	var fireProjectileInstance = fireProjectileScene.instance()
	fireProjectileInstance.position = owner.get_node("Position2DShot").global_position
	fireProjectileInstance.shooter = owner 
	fireProjectileInstance.velocity = Vector2(x, y).normalized()
	owner.get_parent().add_child(fireProjectileInstance)