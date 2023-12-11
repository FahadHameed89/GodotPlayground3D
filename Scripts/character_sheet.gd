extends Control


@onready var stat_points_label = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/HBoxContainer/StatPointsLabel
var path_main_stats = "HBoxContainer/VBoxContainer/HBoxContainer/MainStats"

var available_points = 5
var str_add = 0
var vit_add = 0
var dex_add = 0
var agi_add = 0
var spr_add = 0
var cha_add = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	stat_points_label.set_text(str(available_points) + " Points")
	if available_points == 0:
		pass
	else:
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)


func _on_strength_plus_pressed():
	print("Strength + 1")


func _on_vitality_plus_pressed():
	print("Vitality + 1")


func _on_dexterity_plus_pressed():
	print("Dexterity + 1")


func _on_agility_plus_pressed():
	print("Agility + 1")


func _on_spirit_plus_pressed():
	print("Spirit + 1")


func _on_charisma_plus_pressed():
	print("Charisma + 1")



func _on_strength_minus_pressed():
	print("Strength - 1")


func _on_vitality_minus_pressed():
	print("Vitality - 1")


func _on_dexterity_minus_pressed():
	print("Dexterity - 1")


func _on_agility_minus_pressed():
	print("Agility - 1")


func _on_spirit_minus_pressed():
	print("Spirit - 1")


func _on_charisma_minus_pressed():
	print("Charisma - 1")
