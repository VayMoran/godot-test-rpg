extends CollisionPolygon2D

func _ready():
	pass

func _on_House_body_entered(body):
	print("You are in front of the house door!")
	print(body)

func _on_House_body_exited( body ):
	print("You are walking away from the house!")