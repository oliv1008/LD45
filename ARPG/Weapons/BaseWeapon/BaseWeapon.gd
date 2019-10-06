extends Node2D

export (String) var nameOfWeapon
export (float) var damageMultiplier
export (float) var rateOfFire
var canShot = true
export (float) var ammoPerShot
export (PackedScene) var projectile
onready var holder = self

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = rateOfFire
	if get_parent().get_class() == "KinematicBody2D":
		holder = get_parent()
		print("Arme fille d'un kinematicBody, on initialise le porteur")

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_RIGHT):
		shot(get_global_mouse_position())

func shot(targetPos):
	if canShot:
		var projectileInstance = projectile.instance()
		projectileInstance.damage = PersoGlobal.distanceDamage * damageMultiplier
		projectileInstance.shooter = holder
		print("self = ", self)
		print("holder = ", holder)
		projectileInstance.position = $EndBarrel.position + position
		holder.get_parent().add_child(projectileInstance)
		canShot = false
		$Timer.start()

func _on_Timer_timeout():
	canShot = true
	$Timer.stop()
