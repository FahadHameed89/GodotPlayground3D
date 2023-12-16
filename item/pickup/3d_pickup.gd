extends MeshInstance3D
@onready var sprite_3d = $"../Sprite3D"

@onready var mesh_instance_3d = $"."
@export var spin_speed = 2.0

func _ready() -> void:
	sprite_3d.visible = false

func _physics_process(delta: float) -> void:
	mesh_instance_3d.rotate_y(delta * spin_speed)
