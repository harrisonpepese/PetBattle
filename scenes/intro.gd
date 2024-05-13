extends Node2D

@onready var title = $Panel/Title
const introTime = 2
var _time = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_time += delta
	if(_time > 2):
		get_tree().change_scene_to_file("res://scenes/login.tscn")
