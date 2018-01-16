extends KinematicBody2D

#Movement
const DOWN = 0
const UP = 1
const LEFT = 2
const RIGHT = 3

const IDLE = 0
const WALK = 1

# Configuration variables
export(float) var walk_speed = 120.0
export(float) var walk_animation_scale = 1.2

# State keeping
var current_animation = IDLE
var current_direction = DOWN

# Position Tracking
var player_position = Vector2(0,0)

func _ready():
	#Create variable representing animation tree player
	var treeplayer = get_node("treeplayer")
	# Load animation defaults and set active
	treeplayer.transition_node_set_current("move_transition", current_animation)
	treeplayer.transition_node_set_current("idle_transition", current_direction)
	treeplayer.timescale_node_set_scale("walk_scale", walk_animation_scale)
	treeplayer.set_active(true)

func _physics_process(delta):
	var is_paused = get_tree().is_paused();
	# Poll for movement
	var move_up = Input.is_action_pressed("ui_up")
	var move_left = Input.is_action_pressed("ui_left")
	var move_down = Input.is_action_pressed("ui_down")
	var move_right = Input.is_action_pressed("ui_right")
	var escape = Input.is_action_just_pressed("ui_cancel")
	var menu = Input.is_action_just_pressed("ui_menu")
	 
	# Reset direction
	var direction = Vector2(0,0)
	# Reset animation to idle position
	var animation = IDLE
	# Lock idle and movement
	var anim_direction = current_direction
	
	# Set direction of movment
	if(!is_paused):
		if(move_up):
			direction.y = -1
			anim_direction = UP
		elif(move_down):
			direction.y = 1
			anim_direction = DOWN
		if(move_left):
			direction.x = -1
			anim_direction = LEFT
		elif(move_right):
			direction.x = 1
			anim_direction = RIGHT
		
		# Move by direction, speed, and delta time
		move_and_collide(direction * walk_speed * delta);
		
		# Lock idle and movement
		current_direction = anim_direction
		# check if moving or not
		if(!is_paused and (move_up or move_left or move_down or move_right)):
			current_animation = WALK
		else:
			current_animation = IDLE
		
		update_animation()
		
		# Adjust Z order
		for body in get_tree().get_nodes_in_group("entity"):
			if(body == self):
				continue
			if(body.get_global_pos().y > get_global_pos().y):
				body.set_z(get_z() + 1)
			else:
				body.set_z(get_z() - 1)
	if (escape):
		get_tree().paused = true
		get_node("/root/Global").goto_scene("res://scenes/menu_pause.tscn")
	if (menu):
		print("Menu")
		get_tree().paused = true
		get_node("/root/Global").goto_scene("res://scenes/menu_landing.tscn")
				
func update_animation():
	# Get animation tree player
	var tree_player = get_node("treeplayer")
	tree_player.transition_node_set_current("move_transition", current_animation)
	# Check if idle, change animation accordingly
	if (current_animation == IDLE):
		tree_player.transition_node_set_current("idle_transition", current_direction)
	else:
		tree_player.transition_node_set_current("walk_transition", current_direction)