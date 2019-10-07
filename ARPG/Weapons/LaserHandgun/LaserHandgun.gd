extends Node2D

export (String) var nameOfWeapon
export (float) var damageMultiplier
export (float) var rateOfFire
var canShot = true
export (float) var shotsPerAmmo
export (PackedScene) var projectile
var shotCount = 0
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
	print("$EndBarrel.global_position = ", $EndBarrel.global_position)
	if (canShot && PersoGlobal.ammoLeft >= 1):
		var projectileInstance = projectile.instance()
		projectileInstance.damage = PersoGlobal.distanceDamage * damageMultiplier
		projectileInstance.shooter = holder
		print("self = ", self)
		print("holder = ", holder)
		projectileInstance.position = $EndBarrel.global_position
		holder.get_parent().add_child(projectileInstance)
		shotCount += 1
		if (shotCount >= shotsPerAmmo):
			PersoGlobal.ammoLeft -= 1
			shotCount = 0
		var notificationData = "ammo"
		nc.post_notification("CHANGE_HUD",notificationData)
		canShot = false
		$Timer.start()

func _on_Timer_timeout():
	canShot = true
	$Timer.stop()
