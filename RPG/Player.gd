extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var body_sprite = $BodySprite
onready var weapon_sprite = $WeaponSprite
var screen_size
var bodySize  = Vector2()

export var SPEED = 400 #(pixels/sec)

# Called when the node enters the scene tree for the first time.
func _ready():
	bodySize = body_sprite.frames.get_frame("default", 0).get_size()
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	#Handling weapon sprite's position
	var weaponPos  = Vector2() 
	weaponPos = body_sprite.get_position()
	weaponPos.x = $BodySprite/RightCornerBody.position.x
	weapon_sprite.frames.get_frame("default", weapon_sprite.frame).get_size()


