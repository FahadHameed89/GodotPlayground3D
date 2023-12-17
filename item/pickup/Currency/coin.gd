extends RigidBody3D

@onready var mesh_instance_3d = $MeshInstance3D
@export var coins_added = 1
@export var rotation_speed = 2.0
var text = "You have "+str(GlobalEvents.current_gold)+" coins !!"

func _ready():
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	mesh_instance_3d.rotate_y(delta * rotation_speed)
	


func _on_area_3d_body_entered(body):

	var text = "You have "+str(GlobalEvents.current_gold)+" coins !!"
	GlobalEvents.current_gold += coins_added
	print(text)
	
	queue_free()
