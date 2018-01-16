extends CollisionPolygon2D

func _ready():
	pass

func _on_House_body_entered(body):
	if (body.get_name() == "Player"):
		print("You are in front of the house door!")

func _on_House_body_exited(body):
	if (body.get_name() == "Player"):
		print("You are walking away from the door!")