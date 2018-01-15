extends CollisionPolygon2D

func _ready():
	pass
	
func _on_Events_body_entered( body ):
	print("You have entered water!")


func _on_Events_body_exited( body ):
	print("You have left the water!")
