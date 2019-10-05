extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var body_sprite = $BodySprite
onready var weapon_sprite = $WeaponSprite
var screen_size
var bodySize  = Vector2()

var projectile = preload("res://RPG/Projectile.tscn")

export var SPEED = 450 #(pixels/sec)

# Called when the node enters the scene tree for the first time.
func _ready():
	bodySize = body_sprite.frames.get_frame("default", 0).get_size()
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
		#Handling inputs
	var velocity = Vector2()  # The player's movement vector.
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
		fire()
	
	move_and_collide(velocity * delta)

func fire():
	var bullet = projectile.instance()
	bullet.init(self)
	bullet.position = global_position
	get_parent().add_child(bullet)