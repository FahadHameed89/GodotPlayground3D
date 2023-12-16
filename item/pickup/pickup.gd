extends RigidBody3D

@export var slot_data: SlotData
@export var coins_added = 0
@onready var sprite_3d: Sprite3D = $Sprite3D
var rotation_speed = 2.0

func _ready() -> void:
	if sprite_3d.texture:
		sprite_3d.texture = slot_data.item_data.texture
	else:
		pass
func _physics_process(delta: float) -> void:
	sprite_3d.rotate_y(delta * rotation_speed)


func _on_area_3d_body_entered(body):
	if body.inventory_data.pick_up_slot_data(slot_data):
		print("item added to inventory")
		GlobalEvents.current_gold += coins_added
		queue_free()
