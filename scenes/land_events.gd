extends CollisionPolygon2D

var is_entered = false
var event_name = "land"

func _ready():
	pass
	
func _physics_process(delta):
	if(is_entered):
		if(Input.is_action_just_pressed("ui_accept")):
			get_node("/root/event_manager").load_event(event_name)
			
func check_player(body, status):
	if (body.get_name() == "Player"):
		is_entered = status
		
func _on_tree_event_1_body_entered( body ):
	check_player(body, true)
	event_name = "tree"


func _on_tree_event_1_body_exited( body ):
	check_player(body,false)


func _on_tree_event_2_body_entered( body ):
	check_player(body, true)
	event_name = "tree"


func _on_tree_event_2_body_exited( body ):
	check_player(body,false)


func _on_tree_event_3_body_entered( body ):
	check_player(body, true)
	event_name = "tree"


func _on_tree_event_3_body_exited( body ):
	check_player(body,false)


func _on_tree_event_4_body_entered( body ):
	check_player(body, true)
	event_name = "tree"


func _on_tree_event_4_body_exited( body ):
	check_player(body,false)


func _on_tree_event_5_body_entered( body ):
	check_player(body, true)
	event_name = "tree"


func _on_tree_event_5_body_exited( body ):
	check_player(body,false)


func _on_tree_event_6_body_entered( body ):
	check_player(body, true)
	event_name = "tree"


func _on_tree_event_6_body_exited( body ):
	check_player(body,false)


func _on_tree_event_7_body_entered( body ):
	check_player(body, true)
	event_name = "tree"


func _on_tree_event_7_body_exited( body ):
	check_player(body,false)


func _on_tree_event_8_body_entered( body ):
	check_player(body, true)
	event_name = "tree"


func _on_tree_event_8_body_exited( body ):
	check_player(body,false)


func _on_rock_event_1_body_entered( body ):
	check_player(body, true)
	event_name = "rock"


func _on_rock_event_1_body_exited( body ):
	check_player(body,false)


func _on_rock_event_2_body_entered( body ):
	check_player(body, true)
	event_name = "rock"


func _on_rock_event_2_body_exited( body ):
	check_player(body,false)


func _on_rock_event_3_body_entered( body ):
	check_player(body, true)
	event_name = "rock"


func _on_rock_event_3_body_exited( body ):
	check_player(body,false)


func _on_rock_event_4_body_entered( body ):
	check_player(body, true)
	event_name = "rock"


func _on_rock_event_4_body_exited( body ):
	check_player(body,false)


func _on_rock_event_5_body_entered( body ):
	check_player(body, true)
	event_name = "rock"


func _on_rock_event_5_body_exited( body ):
	check_player(body,false)


func _on_four_pile_event_body_entered( body ):
	check_player(body, true)
	event_name = "flour pile"


func _on_four_pile_event_body_exited( body ):
	check_player(body,false)


func _on_flour_open_event_body_entered( body ):
	check_player(body, true)
	event_name = "open flour"


func _on_flour_open_event_body_exited( body ):
	check_player(body,false)


func _on_barrels_event_body_entered( body ):
	check_player(body, true)
	event_name = "barrels"


func _on_barrels_event_body_exited( body ):
	check_player(body,false)


func _on_logs_event_body_entered( body ):
	check_player(body, true)
	event_name = "logs"


func _on_logs_event_body_exited( body ):
	check_player(body,false)


func _on_anvil_event_body_entered( body ):
	check_player(body, true)
	event_name = "anvil"


func _on_anvil_event_body_exited( body ):
	check_player(body,false)


func _on_statue_event_body_entered( body ):
	check_player(body, true)
	event_name = "statue"


func _on_statue_event_body_exited( body ):
	check_player(body,false)


func _on_door_body_entered( body ):
	check_player(body, true)
	event_name = "door"


func _on_door_body_exited( body ):
	check_player(body, false)
