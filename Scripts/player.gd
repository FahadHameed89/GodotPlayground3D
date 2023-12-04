extends CharacterBody3D

# Player Nodes
@onready var neck = $neck # Controls pivot for free looking
@onready var head = $neck/head # Container for eyes and ears 
@onready var eyes = $neck/head/eyes # Container for the camera rig and animation player

@onready var standing_collision_shape = $standing_collision_shape # for detection 
@onready var crouching_collision_shape = $crouching_collision_shape # for crouching - delete this and change transform of standing_collision_shape instead if you want to refactor

@onready var camera_3d = $neck/head/eyes/Camera3D 
@onready var animation_player = $neck/head/eyes/AnimationPlayer
@onready var audio_stream_player_3d = $feet/AudioStreamPlayer3D


# Raycasts
@onready var ray_cast_3d = $RayCast3D #Standing Check Raycast (Checks above to see if there is enough room to stand up // if it detects anything 2m above the floor it says you cannot stand up )

# Grab Mechanic Variables
@onready var interaction_ray = $neck/head/eyes/Camera3D/InteractionRay 
@onready var holding_position = $neck/head/eyes/Camera3D/HoldingPosition # Adjust this position 'z' to move object closer or further away
@onready var static_body_3d = $neck/head/eyes/Camera3D/StaticBody3D
@onready var joint = $neck/head/eyes/Camera3D/Generic6DOFJoint3D


var picked_object 
var pull_force = 4 # Adjust this to pull objects with more force
var rotation_force = 0.25 # Force of object rotation
var locked = false # Prevents player walking around when rotating object
# 

# Player Speed Variables
var current_speed = 5.0
@export var walking_speed = 4.0
@export var sprinting_speed = 8.0
@export var crouching_speed = 1.5

# States

var walking = false
var sprinting = false
var crouching = false
var free_looking = false
var sliding = false

# Slide Variables

var slide_timer = 0.0
var slide_timer_max = 1.2
var slide_vector = Vector2.ZERO
var slide_speed = 12.0
var slide_jump_velocity = 7.0 #will override jump_velocity while sliding - broken lmao

# Jump Variables

@export var max_jumps = 2
var available_jumps = max_jumps

# Head Bob Vars

const head_bob_sprinting_speed = 22.0
const head_bob_walking_speed = 14.0
const head_bob_crouching_speed = 10.0

const head_bob_sprinting_intensity = 0.2
const head_bob_walking_intensity = 0.1
const head_bob_crouching_intensity = 0.05

var head_bobbing_vector = Vector2.ZERO
var head_bobbing_index = 0.0
var head_bobbing_current_intensity = 0.0

# Player Movement Variables
@export var jump_velocity = 7.0
@export var base_jump_velocity = 7.0
var lerp_speed = 10.0 #used to change the speed of the player
var air_lerp_speed = 3.0
var crouching_depth = -0.4 #How much the height changes when crouching
var free_look_tilt_amount = -5
var last_velocity = Vector3.ZERO

# Player Mouse Input Variables

var direction = Vector3.ZERO #Default starting direction is zero
const mouse_sens_h = 0.25 #Horizontal mouse sensitivity
const mouse_sens_v = 0.2 #Vertical mouse sensitivity


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func rotate_object(event):
	if picked_object != null:
		if event is InputEventMouseMotion:
			static_body_3d.rotate_x(deg_to_rad(event.relative.y * rotation_force))
			static_body_3d.rotate_y(deg_to_rad(event.relative.x * rotation_force))

func pick_object():
	var collider = interaction_ray.get_collider()
	if collider != null and collider is RigidBody3D:
		print("Colliding with a rigid body")
		picked_object = collider
		joint.set_node_b(picked_object.get_path())

func remove_object():
	if picked_object != null:
		picked_object = null
		joint.set_node_b(joint.get_path())

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #Locks mouse during gameplay 

func _input(event):
	if event is InputEventMouseMotion && !locked:
		#Free Looking Logic
		if free_looking:
			neck.rotate_y(deg_to_rad(-event.relative.x * mouse_sens_h))
			neck.rotation.y = clamp(neck.rotation.y, deg_to_rad(-140), deg_to_rad(140))
		else:
		#Normal Looking Logic
			rotate_y(deg_to_rad(event.relative.x * -mouse_sens_h))
			head.rotate_x(deg_to_rad(event.relative.y * -mouse_sens_v))
			head.rotation.x = clamp(head.rotation.x, deg_to_rad(-80), deg_to_rad(80))

	#DEBUG
	if Input.is_action_just_pressed("left_click"):
		if picked_object == null:
			pick_object()
		elif picked_object != null:
			remove_object()
			
	# Handle Object Rotation Inputs and lock out camera rotation during object rotation
	if Input.is_action_pressed("rotate_object"):
		locked = true
		rotate_object(event)
	if Input.is_action_just_released("rotate_object"):
		locked = false

func _physics_process(delta):
	# Getting movement input
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	
	# Handle Movement State
	
	# Crouching
	
	if Input.is_action_pressed("crouch") || sliding:
		current_speed = lerp(crouching_speed, crouching_speed, delta*lerp_speed)
		head.position.y = lerp(head.position.y, crouching_depth, delta*lerp_speed)
		standing_collision_shape.disabled = true
		crouching_collision_shape.disabled = false
		
	# Handle Slide Begin
		if sprinting && input_dir != Vector2.ZERO:
			sliding = true
			slide_timer = slide_timer_max
			slide_vector = input_dir
			jump_velocity = slide_jump_velocity
			free_looking = true
			print("slide begin")
		
		walking = false
		sprinting = false
		crouching = true
		#print("crouch start")
		
	elif !ray_cast_3d.is_colliding():
		#Standing
		standing_collision_shape.disabled = false
		crouching_collision_shape.disabled = true
		head.position.y = lerp(head.position.y, 0.0, delta*lerp_speed)
		#print("stand")
		
		#Sprinting
		if Input.is_action_pressed("sprint"):
			current_speed =  lerp(sprinting_speed, sprinting_speed, delta*lerp_speed)
			walking = false
			sprinting = true
			crouching = false
			#print("sprint")
			
		else:
		#Walking 
			current_speed = lerp(walking_speed, walking_speed, delta*lerp_speed)
			walking = true
			sprinting = false
			crouching = false

# Handle Free Looking
	if Input.is_action_pressed("free_look") || sliding:
		free_looking = true
		
		if sliding:
			eyes.rotation.z = lerp(eyes.rotation.z, deg_to_rad(5), delta*lerp_speed)
		else:
			eyes.rotation.z = deg_to_rad(neck.rotation.y*free_look_tilt_amount)
	else: 
		free_looking = false
		neck.rotation.y = lerp(neck.rotation.y, 0.0, delta*lerp_speed)
		eyes.rotation.z = lerp(eyes.rotation.z, 0.0, delta*lerp_speed)

	# Handle Sliding End (Decrement timer and detect end of slide)
	
	if sliding:
		slide_timer -= delta
		if slide_timer <= 0:
			sliding = false
			print ("Slide end")
			free_looking = false
			#jump_velocity = base_jump_velocity
			
	# Handle Head Bobbing
	if sprinting:
		head_bobbing_current_intensity = head_bob_sprinting_intensity
		head_bobbing_index += head_bob_sprinting_speed*delta
	elif walking:
		head_bobbing_current_intensity = head_bob_walking_intensity
		head_bobbing_index += head_bob_walking_speed*delta
	elif crouching:
		head_bobbing_current_intensity = head_bob_crouching_intensity
		head_bobbing_index += head_bob_crouching_speed*delta
	
	if is_on_floor() && !sliding && input_dir != Vector2.ZERO:
		head_bobbing_vector.y = sin(head_bobbing_index)
		head_bobbing_vector.x = sin(head_bobbing_index/2)+0.5
		
		eyes.position.y = lerp(eyes.position.y, head_bobbing_vector.y*(head_bobbing_current_intensity/2.0), delta*lerp_speed)
		eyes.position.x = lerp(eyes.position.x, head_bobbing_vector.x*(head_bobbing_current_intensity), delta*lerp_speed)

	else:
		eyes.position.y = lerp(eyes.position.y, 0.0, delta*lerp_speed)
		eyes.position.x = lerp(eyes.position.x, 0.0, delta*lerp_speed)
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		jump_velocity = base_jump_velocity


	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and available_jumps > 0:
		velocity.y = jump_velocity
		sliding = false
		animation_player.play("jump")
		available_jumps -= 1
		
	#Handle Landing
	if is_on_floor():
		if last_velocity.y < 0.0:
			animation_player.play("landing")
			print(last_velocity.y)
			available_jumps = max_jumps

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_on_floor():
		direction = lerp(direction, (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta*lerp_speed)
	else:
		if input_dir != Vector2.ZERO:
			direction = lerp(direction, (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta*air_lerp_speed)
	
	if sliding:
		direction = (transform.basis * Vector3(slide_vector.x, 0, slide_vector.y)).normalized()
		current_speed = (slide_timer + 0.1) * slide_speed

	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
		

	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)
	last_velocity = velocity
	move_and_slide()

	if picked_object != null:
		var a = picked_object.global_transform.origin
		var b = holding_position.global_transform.origin
		picked_object.set_linear_velocity((b-a)*pull_force)
