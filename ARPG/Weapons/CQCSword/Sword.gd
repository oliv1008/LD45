extends Area2D

export (String) var nameOfWeapon
export (float) var damageMultiplier
export (float) var rateOfAttack
var canAttack = true
var holder = self

# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.disabled = true
	$Timer.wait_time = rateOfAttack
	if get_parent().get_class() == "KinematicBody2D":
		holder = get_parent()
		print("Arme fille d'un kinematicBody, on initialise le porteur")



func _on_Spear_body_entered(body):
	if ($CollisionShape2D.disabled == false):
		print("ici")
		if body.get_class() == "KinematicBody2D":
			print("kinematic")
			if body.has_method("get_hit") && body.get_name() != "Player":
				print("got hit")
				body.get_hit(PersoGlobal.meleeDamage * damageMultiplier)

func attack():
	canAttack = false
	$CollisionShape2D.disabled = false
	$Timer.start()
	$AnimationPlayer.play("BaseAttack")


func _on_Timer_timeout():
	canAttack = true
	$Timer.stop()

func _on_AnimationPlayer_animation_finished(anim_name):
	$CollisionShape2D.disabled = true