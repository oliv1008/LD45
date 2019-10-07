extends Area2D

export (float) var damageMultiplier = 1.0
export (float) var rateOfAttack = 0.5
var canAttack = true
var holder = self

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	$Timer.wait_time = rateOfAttack
	if get_parent().get_class() == "KinematicBody2D":
		holder = get_parent()
		print("Arme fille d'un kinematicBody, on initialise le porteur")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
		

func _on_BaseCQCWeapon_body_entered(body):
	if body.get_class() == "KinematicBody2D":
		if body.has_method("get_hit") && body.name != "Player":
			body.get_hit(PersoGlobal.meleeDamage * damageMultiplier)

func attack():
	visible = true
	canAttack = false
	$Timer.start()
	$AnimationPlayer.play("BaseAttack")

func _on_Timer_timeout():
	canAttack = true
	$Timer.stop()

func _on_AnimationPlayer_animation_finished(anim_name):
	visible = false
