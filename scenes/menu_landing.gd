extends Control

func _ready():
	pass
func _physics_process(delta):
	var escape = Input.is_action_just_pressed("ui_cancel")
	
	if (escape):
		get_tree().paused = false
		var scene_load = "res://scenes/" + get_node("/root/Global").current_location + ".tscn"
		get_node("/root/Global").goto_scene(scene_load)