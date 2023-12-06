extends ColorRect
@onready var cursor = $"."
@onready var interaction_ray = $"../../neck/head/eyes/Camera3D/InteractionRay"
@onready var hand_ray = $"../../neck/head/eyes/Camera3D/HandRay"
@onready var hook_ray = $"../../neck/head/eyes/Camera3D/HookRay"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if interaction_ray.is_colliding() == true:
		cursor.color = "1f7bc6"
		cursor.scale = Vector2(1.0,1.0)
	if hand_ray.is_colliding() == true:
		cursor.color = "ff4a36"
		cursor.scale = Vector2(1.5,1.5)
	if hook_ray.is_colliding() == true:
		cursor.color = "18112b"
		cursor.scale = Vector2(1.5,1.5)



	if interaction_ray.is_colliding() == false:
		cursor.color = "ffffff"
		cursor.scale = Vector2(1,1)
