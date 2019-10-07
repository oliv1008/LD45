extends Node2D

func _ready():
	pass # Replace with function body.

func _on_AutoDestroy_timeout():
	self.queue_free()
