
extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#$HBoxContainer/ARPGUI.visible = false
	loadLevel("res://ARPG/Maps/testmap.tscn")

func loadLevel(scene):
	var s = ResourceLoader.load(scene)
	var scene_loaded = s.instance()
	# add scene to root
	#$HBoxContainer/ARPGUI/ViewportARPG.add_child(scene_loaded)
	
	print("launching scene : " + scene)