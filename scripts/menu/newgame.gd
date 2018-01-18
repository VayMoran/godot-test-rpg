extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _on_newgame_pressed():
	get_node("/root/scene_manager").goto_scene("res://scenes/land.tscn")
