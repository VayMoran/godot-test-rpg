extends CollisionPolygon2D

func _ready():
	pass
	
func _on_Water_body_entered(body):
	if (body.get_name() == "Player"):
		print ("You have entered the water!")


func _on_Water_body_exited(body):
	if (body.get_name() == "Player"):
		print ("You have left the water!")
