extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	var escape = Input.is_action_just_pressed("ui_cancel")
	
	if (escape):
		quit()



func _on_Paused_Button_pressed():
	# Resume game
	get_tree().paused = false
	# Load main land scene
	var scene_load = "res://scenes/" + get_node("/root/Global").current_location + ".tscn"
	get_node("/root/Global").goto_scene(scene_load)
