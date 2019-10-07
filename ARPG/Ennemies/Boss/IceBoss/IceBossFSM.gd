extends "res://state/StateMachine.gd"

var sequence_cycles = 0
export(int, 1, 3) var phase = 1
var pv = 100

func _ready():
	for child in get_children():
		child.connect("finished", self, "go_to_next_state")

func initialize():
	change_phase(phase)

func _on_active_state_finished():
	go_to_next_state()

func go_to_next_state(state_override=null):
	if not active:
		return
	current_state.exit()
	current_state = _decide_on_next_state() if state_override == null else state_override
	emit_signal("state_changed", current_state)
	current_state.enter()

func _decide_on_next_state():
	# Battle start
	if current_state == null:
		return $Spawn
	if current_state == $Spawn:
		return $StraightShot
		
	if current_state != $Wait:
		return $Wait
	else:
		var nextAction = randi() % 4
		if nextAction == 0:
			return $StraightShot
		if nextAction == 1:
			return $SpiralShot
		if nextAction == 2:
			return $ScatterShot
		if nextAction == 3:
			return $CardinalShot

func change_phase(new_phase):
	phase = new_phase
	var anim_player = owner.get_node('AnimationPlayer')
	match new_phase:
		1:
			anim_player.playback_speed = 1.0
		2:
			anim_player.playback_speed = 1.2
			
	emit_signal("phase_changed", new_phase)

func _on_Health_health_depleted():
	go_to_next_state($Die)


func _on_AnimationPlayer_animation_finished(anim_name):
	current_state._on_animation_finished(anim_name)
