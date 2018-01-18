extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var player = load("res://scenes/player.tscn")
	var player_instance = player.instance()
	player_instance.set_name("player")
	add_child(player_instance)
	player_instance.position = Vector2(582, 408)
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
