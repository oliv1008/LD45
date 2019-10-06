extends KinematicBody2D

export (int) var pv = 5
var mouvementSpeed = 200
onready var raycast = $RayCast2D
onready var tweenNode = $Tween
var isAttacking = false
var currentPos = Vector2()
var playerPos = Vector2()
var velocity = Vector2()
var posToMove = Vector2()

onready var Hurtbox = $Area2D
onready var Hitbox = $CollisionShape2D

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	currentPos = position
	playerPos = get_parent().get_node("Player").position
	posToMove = playerPos - currentPos
	if not isAttacking && not abs(posToMove.x) < 2 && not abs(posToMove.y) < 2:
		look_at(playerPos)
		velocity = posToMove.normalized() * mouvementSpeed
		move_and_collide(velocity*delta)

	if raycast.is_colliding():
		isAttacking = true
		attack()

	if pv == 0:
		var animationPlayer = $AnimationPlayer
		animationPlayer.play("die")
		isAttacking = true
		Hurtbox.visible = false
		Hitbox.visible = false

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
	
func _on_hit(degats):
	pv -= degats

func attack():
	var animationPlayer = $AnimationPlayer
	animationPlayer.play("attack")
	
func die():
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