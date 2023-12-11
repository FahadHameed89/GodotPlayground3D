extends Node3D

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("CircleAction_001")
	animation_player.play("EmptyAction_002")

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
