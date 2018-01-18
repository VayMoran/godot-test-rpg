extends CollisionPolygon2D

# Check entered status
var is_entered = false

func _ready():
	pass

func _physics_process(delta):
	# If in front of the door
	if (is_entered):
		# If player is hitting interact button
		if (get_node("/root/scene_manager").is_interacting):
			# Change to house scene
			get_node("/root/scene_manager").goto_scene("res://scenes/house.tscn")
			get_node("/root/scene_manager").current_location = "house"
			# Remove interacting status
			get_node("/root/scene_manager").is_interacting = false

func _on_House_body_entered(body):
	if (body.get_name() == "Player"):
		get_node("/root/event_manager").load_event("door")
		is_entered = true

func _on_House_body_exited(body):
	if (body.get_name() == "Player"):
		print("You are walking away from the door!")
		is_entered = false