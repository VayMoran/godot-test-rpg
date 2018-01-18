extends CollisionPolygon2D

# Is the player in the water?
var is_entered = false

func _ready():
	pass

func _physics_process(delta):
	# While the player is in the water
	if (is_entered):
		# Get global status of interacting (event polling stored globally)
		if (get_node("/root/scene_manager").is_interacting):
			print("Splash")
			# End global interacting status
			get_node("/root/scene_manager").is_interacting = false
	
	
func _on_Water_body_entered(body):
	# Checks if player entered Water Area2D
	if (body.get_name() == "Player"):
		# Sets status to entered
		is_entered = true
		print ("You have entered the water!")

func _on_Water_body_exited(body):
	# Checks if player exited Water Area2D
	if (body.get_name() == "Player"):
		# Sets status to exited
		is_entered = false
		print ("You have left the water!")