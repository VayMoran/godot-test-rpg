extends CollisionPolygon2D

func _ready():
	pass

func _on_House_body_entered(body):
	print("You are in front of the house door!")
	print(body)
	get_tree().change_scene("res://scenes/House.tscn")

func _on_House_body_exited( body ):
	print("You are walking away from the house!")

func _on_HouseEvents_body_shape_entered( body_id, body, body_shape, area_shape ):
	pass