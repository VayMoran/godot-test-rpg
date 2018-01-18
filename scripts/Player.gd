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

var is_paused = false

func _ready():
	# Helper Function to load animation files
	load_animations()
	# Pull position from global value
	self.position = get_node("/root/scene_manager").get_player_position()

func _physics_process(delta):
	is_paused = get_tree().is_paused();
	
	## Get player movement direction
	var direction = move_player()
	# Move by direction, speed, and delta time
	move_and_collide(direction * walk_speed * delta);
	
func move_player():
	# Reset direction
	var direction = Vector2(0,0)
	# Reset animation to idle position
	var animation = IDLE
	# Lock idle and movement
	var anim_direction = current_direction
	
	# Set direction of movment
	if( Input.is_action_pressed("ui_up")):
		direction.y = -1
		anim_direction = UP
	elif( Input.is_action_pressed("ui_down")):
		direction.y = 1
		anim_direction = DOWN
	if( Input.is_action_pressed("ui_left")):
		direction.x = -1
		anim_direction = LEFT
	elif( Input.is_action_pressed("ui_right")):
		direction.x = 1
		anim_direction = RIGHT
	
	# Menu access
	if (Input.is_action_just_pressed("ui_cancel")):
		# Pause the game
		get_tree().paused = true
		# Save position on map for persistance
		get_node("/root/scene_manager").set_player_position(self.position, get_node("/root/scene_manager").current_location)
		# Switch to menu screen
		get_node("/root/scene_manager").goto_scene("res://scenes/menu/menu_pause.tscn")
	if (Input.is_action_just_pressed("ui_menu")):
		# Pause the game
		get_tree().paused = true
		# Save postion on map for persistance
		get_node("/root/scene_manager").set_player_position(self.position, get_node("/root/scene_manager").current_location)
		# Switch to menu screen
		get_node("/root/scene_manager").goto_scene("res://scenes/menu/menu_landing.tscn")
	if (Input.is_action_just_pressed("ui_accept")):
		if(!get_node("/root/scene_manager").is_interacting):
			get_node("/root/scene_manager").is_interacting = true
			
	# Lock idle and movement
	current_direction = anim_direction
	# check if moving or not
	if((Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_left") or 
	Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right"))):
		current_animation = WALK
	else:
		current_animation = IDLE
		
	update_animation()
	
	return direction

func load_animations():
	#Create variable representing animation tree player
	var treeplayer = get_node("treeplayer")
	# Load animation defaults and set active
	treeplayer.transition_node_set_current("move_transition", current_animation)
	treeplayer.transition_node_set_current("idle_transition", current_direction)
	treeplayer.timescale_node_set_scale("walk_scale", walk_animation_scale)
	treeplayer.set_active(true)
	
func update_animation():
	# Get animation tree player
	var tree_player = get_node("treeplayer")
	tree_player.transition_node_set_current("move_transition", current_animation)
	# Check if idle, change animation accordingly
	if (current_animation == IDLE):
		tree_player.transition_node_set_current("idle_transition", current_direction)
	else:
		tree_player.transition_node_set_current("walk_transition", current_direction)