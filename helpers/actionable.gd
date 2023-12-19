extends Area3D

@export var dialogue_resource: DialogueResource 
@export var dialogue_start: String = "start"

func action() -> void:

	GlobalEvents.can_move = false
	GlobalEvents.can_shoot = false
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
