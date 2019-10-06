extends KinematicBody2D

onready var state_machine = $StateMachine
onready var tween_node = $Tween

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
	
func _on_Health_health_changed(new_health):
#	tween_node.interpolate_property($Pivot, 'scale', Vector2(0.92, 1.12), Vector2(1.0, 1.0), 0.3, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween_node.interpolate_property($AnimatedSprite, 'modulate', Color('#ff48de'), Color('#ffffff'), 0.2, Tween.TRANS_QUINT, Tween.EASE_IN)
	tween_node.start()
	match state_machine.phase:
		1:
			if new_health < 50:
				state_machine.phase = 2
		2:
			if new_health < 25:
				state_machine.phase = 3