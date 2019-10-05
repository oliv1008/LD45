extends KinematicBody2D

export (int) var pv = 1
export (int) var mouvementSpeed = 500
onready var raycast = $RayCast2D
onready var tweenNode = $Tween
var isAttacking = false
var currentPos = Vector2()
var mousePos = Vector2()
var velocity = Vector2()
var posToMove = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	currentPos = position
	mousePos = get_viewport().get_mouse_position()
	posToMove = mousePos - currentPos
	if not isAttacking && not abs(posToMove.x) < 2 && not abs(posToMove.y) < 2:
		look_at(mousePos)
		velocity = posToMove.normalized() * mouvementSpeed
		move_and_collide(velocity*delta)

	if raycast.is_colliding():
		isAttacking = true
		attack()

	if pv == 0:
		die()

#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		dash_to(get_viewport().get_mouse_position())
	if Input.is_mouse_button_pressed(BUTTON_RIGHT):
		isAttacking = true
		attack()
	
func dash_to(targetPos):
	# Here's where the tween happens. Only 2 lines for a bouncy animation (thanks to the elastic easing equation)
	# Tweening the yellow circle (self), its positon parameter, from the current position to the target (last stored player position),
	# for 1 second, using an elastic ease out
	tweenNode.interpolate_property(self, NodePath("position"), position, targetPos, 1, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	# Always start the animation, otherwise nothing happens. The method above merely initializes the tween
	tweenNode.start()
	
func attack():
	var animationPlayer = $AnimationPlayer
	animationPlayer.play("attack")
	
func die():
#	TODO Jouer animations de mort
	queue_free()

#Quand l'animation d'attaque se fini on autorise l'enemie à bouger à nouveau
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		isAttacking = false

#Quand la hitbox d'attaque de l'enemie touche un autre corps
func _on_Area2D_body_entered(body):
	if body == self:
		print("Je suis l'enemie")
	else:
		print("Je suis une cible")
#		if body.has_method("get_attack"):
#			body.get_attack(valeurDeDegat)
