extends KinematicBody2D

onready var body_sprite = $BodySprite

var screen_size
var bodySize  = Vector2()
onready var weapon = $Handgun
var player = true

var projectile = preload("res://ARPG/Projectile.tscn")

export var SPEED = 450 #(pixels/sec)


func _ready():
	bodySize = body_sprite.frames.get_frame("default", 0).get_size()
	screen_size = get_viewport_rect().size
	weapon.position = $Position2D.position


func _physics_process(delta):

	look_at(get_global_mouse_position())
	var velocity = Vector2()  # The player's movement vector.
	#position += velocity * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		pass #$AnimatedSprite.play()
	else:
		pass #$AnimatedSprite.stop()
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		weapon.shot(get_viewport().get_mouse_position())
	
	move_and_collide(velocity * delta)

func get_hit():
	print("énorme bitasse")
	PersoGlobal.pv -= 1
	var notificationData = "pv"
	nc.post_notification("CHANGE_HUD",notificationData)

func fire():
	var bullet = projectile.instance()
	bullet.init(self)
	bullet.position = global_position
	get_parent().add_child(bullet)