extends KinematicBody2D

const GRAVITY = 200.0
const WALK_SPEED = 150

func _ready():
	get_node("Sprite").connect("tree_entered", self, "_physics_process")
	pass
	
func _physics_process(delta):
	var velocity = Vector2()
	
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -WALK_SPEED
	if (Input.is_action_pressed("ui_right")):
		velocity.x =  WALK_SPEED
	if (Input.is_action_pressed("ui_up")):
		velocity.y = -WALK_SPEED
	if (Input.is_action_pressed("ui_down")):
		velocity.y = WALK_SPEED
		
	var motion = velocity * delta
	move_and_collide(motion)