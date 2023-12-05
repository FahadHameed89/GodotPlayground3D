extends ColorRect
@onready var interaction_ray = $"../../neck/head/eyes/Camera3D/InteractionRay"
@onready var cursor = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if interaction_ray.is_colliding() == true:
		cursor.color = "36ffff"
	if interaction_ray.is_colliding() == false:
		cursor.color = "ffffff"
