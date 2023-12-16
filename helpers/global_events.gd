extends Node

# can_move is a variable that locks pretty much any input action that is not related to menus, selecting dialogue options, or accessing inventory

@export var can_move = true

@export var current_gold = 100

func get_movement_state(_state):
	return can_move

func move_locked():
	can_move = false
	
func move_freed():
	can_move = true
