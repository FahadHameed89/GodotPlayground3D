extends CharacterBody3D

# Player Nodes
@onready var head = $neck/head
@onready var standing_collision_shape = $standing_collision_shape
@onready var crouching_collision_shape = $crouching_collision_shape
@onready var ray_cast_3d = $RayCast3D

# Player Speed Variables
var current_speed = 5.0
@export var walking_speed = 5.0
@export var sprinting_speed = 10.0
@export var crouching_speed = 3.0

# States

var walking = false
var sprinting = false
var crouching = false
var free_looking = false
var sliding = false

# Player Movement Variables
@export var jump_velocity = 4.5
var lerp_speed = 10.0 #used to change the speed of the player
var crouching_depth = -0.2 #How much the height changes when crouching

# Player Mouse Input Variables

var direction = Vector3.ZERO #Default starting direction is zero
const mouse_sens_h = 0.25 #Horizontal mouse sensitivity
const mouse_sens_v = 0.2 #Vertical mouse sensitivity


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #Locks mouse during gameplay 

func _input(event):
	if event is InputEventMouseMotion:
		#Mouse Looking Logic
		rotate_y(deg_to_rad(event.relative.x * -mouse_sens_h))
		head.rotate_x(deg_to_rad(event.relative.y * -mouse_sens_v))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _physics_process(delta):
	
	# Movement Handling
		#Crouching
	if Input.is_action_pressed("crouch"):
		current_speed = crouching_speed
		head.position.y = lerp(head.position.y, crouching_depth, delta*lerp_speed)
		standing_collision_shape.disabled = true
		crouching_collision_shape.disabled = false
		
		walking = false
		sprinting = false
		crouching = true
		print_debug("crouch start")
		
	elif !ray_cast_3d.is_colliding():
		#Standing
		standing_collision_shape.disabled = false
		crouching_collision_shape.disabled = true
		head.position.y = lerp(head.position.y, 0.0, delta*lerp_speed)
		print_debug("stand")
		#Sprinting
		if Input.is_action_pressed("sprint"):
			current_speed = sprinting_speed
			walking = false
			sprinting = true
			crouching = false
			print_debug("sprint")
		else:
		#Walking 
			current_speed = walking_speed
			walking = true
			sprinting = false
			crouching = false

# Handle Free Looking
	if Input.is_action_pressed("free_look"):
		free_looking = true
	else: 
		free_looking = false

	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	direction = lerp(direction, (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta*lerp_speed)
	
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	move_and_slide()
