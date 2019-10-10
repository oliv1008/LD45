extends KinematicBody2D

onready var state_machine = $StateMachine
onready var tween_node = $Tween
var pv = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start():
	state_machine.start()

func set_invincible(value):
	$CollisionShape2D.disabled = value
	
func _on_Die_finished():
	state_machine.set_active(false)
	emit_signal('died')
	queue_free()
	
func get_hit(damage):
	pv -= damage
	_on_Health_health_changed(pv)
	
func _on_Health_health_changed(new_health):
#	tween_node.interpolate_property($Pivot, 'scale', Vector2(0.92, 1.12), Vector2(1.0, 1.0), 0.3, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween_node.interpolate_property($AnimatedSprite, 'modulate', Color('#ff48de'), Color('#ffffff'), 0.2, Tween.TRANS_QUINT, Tween.EASE_IN)
	tween_node.start()
	if new_health < 50:
		state_machine.phase = 2
	if new_health <= 0:
		state_machine.go_to_next_state($StateMachine/Die)
				
func tween_dash_in():
	tween_node.interpolate_property(self, 'position', position, Vector2(position.x, position.y + 125), 0.2, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween_node.start()
	
func tween_move_back():
		tween_node.interpolate_property(self, "position", position, Vector2(position.x, position.y - 125), 0.3, Tween.TRANS_SINE, Tween.EASE_IN)
		tween_node.start()

func _on_Area2D_body_entered(body):
	if body == self:
		pass
	else:
		if (body.has_method("get_hit") && body.player == true):
			body.get_hit()
