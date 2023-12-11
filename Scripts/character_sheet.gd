extends Control



var path_main_stats = "HBoxContainer/VBoxContainer/HBoxContainer/MainStats"

@onready var strength_change = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Strength/StatsBackground/Stats/StrengthChange
@onready var strength_value = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Strength/StatsBackground/Stats/StrengthValue
@onready var strength_minus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Strength/StatsBackground/StrengthMinus
@onready var strength_plus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Strength/StatsBackground/StrengthPlus

@onready var vitality_change = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Vitality/StatsBackground/Stats/VitalityChange
@onready var vitality_value = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Vitality/StatsBackground/Stats/VitalityValue
@onready var vitality_minus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Vitality/StatsBackground/VitalityMinus
@onready var vitality_plus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Vitality/StatsBackground/VitalityPlus

@onready var dexterity_change = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Dexterity/StatsBackground/Stats/DexterityChange
@onready var dexterity_value = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Dexterity/StatsBackground/Stats/DexterityValue
@onready var dexterity_minus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Dexterity/StatsBackground/DexterityMinus
@onready var dexterity_plus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Dexterity/StatsBackground/DexterityPlus

@onready var agility_change = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Agility/StatsBackground/Stats/AgilityChange
@onready var agility_value = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Agility/StatsBackground/Stats/AgilityValue
@onready var agility_minus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Agility/StatsBackground/AgilityMinus
@onready var agility_plus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Agility/StatsBackground/AgilityPlus

@onready var spirit_change = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Spirit/StatsBackground/Stats/SpiritChange
@onready var spirit_value = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Spirit/StatsBackground/Stats/SpiritValue
@onready var spirit_minus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Spirit/StatsBackground/SpiritMinus
@onready var spirit_plus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Spirit/StatsBackground/SpiritPlus

@onready var charisma_change = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Charisma/StatsBackground/Stats/CharismaChange
@onready var charisma_value = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Charisma/StatsBackground/Stats/CharismaValue
@onready var charisma_minus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Charisma/StatsBackground/CharismaMinus
@onready var charisma_plus = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/Charisma/StatsBackground/CharismaPlus


@onready var stat_points_label = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/HBoxContainer/StatPointsLabel
var available_points = 5


var str_add = 0
var vit_add = 0
var dex_add = 0
var agi_add = 0
var spr_add = 0
var cha_add = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	stat_points_label.set_text(str(available_points))
	if available_points == 0:
		pass
	else:
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)
	if strength_value.text == str(100): strength_plus.disabled = true
	if vitality_value.text == str(100): vitality_plus.disabled = true
	if dexterity_value.text == str(100): dexterity_plus.disabled = true
	if agility_value.text == str(100): agility_plus.disabled = true
	if spirit_value.text == str(100): spirit_plus.disabled = true
	if charisma_value.text == str(100): charisma_plus.disabled = true

func _on_strength_plus_pressed():
	print("Strength + 1")
	str_add += 1 # Increase the stat in code
	strength_change.set_text("+ " + str(str_add)) # update the change label
	strength_minus.disabled = false # unlock the minus button
	available_points -= 1 # reduce the available stat points in code
	stat_points_label.set_text(str(available_points)) # reduce the avaiable stat points on the label
	if available_points == 0: # if available points = 0, lock all plus buttons
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(true)


func _on_vitality_plus_pressed():
	print("Vitality + 1")
	vit_add += 1 # Increase the stat in code
	vitality_change.set_text("+ " + str(vit_add)) # update the change label
	vitality_minus.disabled = false # unlock the minus button
	available_points -= 1 # reduce the available stat points in code
	stat_points_label.set_text(str(available_points)) # reduce the avaiable stat points on the label
	if available_points == 0: # if available points = 0, lock all plus buttons
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(true)

func _on_dexterity_plus_pressed():
	print("Dexterity + 1")
	dex_add += 1 # Increase the stat in code
	dexterity_change.set_text("+ " + str(dex_add)) # update the change label
	dexterity_minus.disabled = false # unlock the minus button
	available_points -= 1 # reduce the available stat points in code
	stat_points_label.set_text(str(available_points)) # reduce the avaiable stat points on the label
	if available_points == 0: # if available points = 0, lock all plus buttons
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(true)

func _on_agility_plus_pressed():
	print("Agility + 1")
	agi_add += 1 # Increase the stat in code
	agility_change.set_text("+ " + str(agi_add)) # update the change label
	agility_minus.disabled = false # unlock the minus button
	available_points -= 1 # reduce the available stat points in code
	stat_points_label.set_text(str(available_points)) # reduce the avaiable stat points on the label
	if available_points == 0: # if available points = 0, lock all plus buttons
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(true)

func _on_spirit_plus_pressed():
	print("Spirit + 1")
	spr_add += 1 # Increase the stat in code
	spirit_change.set_text("+ " + str(spr_add)) # update the change label
	spirit_minus.disabled = false # unlock the minus button
	available_points -= 1 # reduce the available stat points in code
	stat_points_label.set_text(str(available_points)) # reduce the avaiable stat points on the label
	if available_points == 0: # if available points = 0, lock all plus buttons
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(true)

func _on_charisma_plus_pressed():
	print("Charisma + 1")
	cha_add += 1 # Increase the stat in code
	charisma_change.set_text("+ " + str(cha_add)) # update the change label
	charisma_minus.disabled = false # unlock the minus button
	available_points -= 1 # reduce the available stat points in code
	stat_points_label.set_text(str(available_points)) # reduce the avaiable stat points on the label
	if available_points == 0: # if available points = 0, lock all plus buttons
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(true)


func _on_strength_minus_pressed():
	print("Strength - 1")
	if str_add > 0:
		str_add -= 1 # Decrease the stat in code
		available_points += 1 # increase the available stat points in code
		strength_change.set_text("+ " + str(str_add)) # increase the available stat points on the str label
		stat_points_label.set_text(str(available_points)) # set the avaiable stat points on the stat points label
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)
	if str_add == 0:
		strength_change.set_text(" ") # update the change label
		strength_minus.disabled = true # if the change value is = 0, lock the minus button


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
