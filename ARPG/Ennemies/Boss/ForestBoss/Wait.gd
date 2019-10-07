extends "res://state/State.gd"

func enter():
	print("On entre dans l'etait Wait")
	owner.get_node('AnimationPlayer').play('Idle')
	$Timer.start()

func exit():
	print("On sort de l'etat Wait")
	$Timer.stop()


func _on_Timer_timeout():
	emit_signal('finished')
