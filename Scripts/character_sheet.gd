extends Control

@onready var player = get_node("../../player")

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

@onready var max_hp_value = $HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Health/MaxHPValue
@onready var hp_regen_value = $HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Health/HPRegenValue
@onready var max_mp_value = $HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Mana/MaxMPValue
@onready var mp_regen_value = $HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Mana/MPRegenValue
@onready var max_sp_value = $HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Stamina/MaxSPValue
@onready var sp_regen_value = $HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Stamina/SPRegenValue

@onready var physical_attack_value = $HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/PhysicalAttack/PhysicalAttackValue
@onready var physical_defense_value = $HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Defense/PhysicalDefenseValue
@onready var critical_value = $HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Critical/CriticalValue
@onready var evasion_value = $HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Evasion/EvasionValue
@onready var action_speed_value = $"HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Action Speed/ActionSpeedValue"
@onready var magic_attack_value = $"HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Magic Attack/MagicAttackValue"
@onready var magic_defense_value = $"HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Magic Defense/MagicDefenseValue"
@onready var minion_power_value = $"HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Minion Power/MinionPowerValue"
@onready var effect_duration_value = $"HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Effect Duration/EffectDurationValue"
@onready var cast_speed_value = $"HBoxContainer/VBoxContainer/HBoxContainer/DerivedStats/VBoxContainer/Cast Speed/CastSpeedValue"


# Placeholder References to Player varaibles in Player.gd -> these values initialize at 0 and are replaced with player vars in ready and load functions. 
@export var player_strength_value = 0
@export var player_vitality_value = 0
@export var player_dexterity_value = 0
@export var player_agility_value = 0
@export var player_spirit_value = 0
@export var player_charisma_value = 0

@export var player_health_value = 0
@export var player_health_regen_value = 0
@export var player_mana_value = 0
@export var player_mana_regen_value = 0
@export var player_stamina_value = 0
@export var player_stamina_regen_value = 0

@export var player_physical_attack_value = 0
@export var player_physical_defense_value = 0
@export var player_critical_chance_value = 0
@export var player_evasion_chance_value = 0
@export var player_action_speed_value = 0

@export var player_magic_attack_value = 0
@export var player_magic_defense_value = 0
@export var player_minion_power_value = 0
@export var player_effect_duration_value = 0
@export var player_cast_speed_value = 0

@onready var stat_points_label = $HBoxContainer/VBoxContainer/HBoxContainer/MainStats/HBoxContainer/StatPointsLabel
var available_points = 5

var str_add = 0
var vit_add = 0
var dex_add = 0
var agi_add = 0
var spr_add = 0
var cha_add = 0


func _ready():
	LoadStats()
	available_points = player.stat_points
	stat_points_label.set_text(str(available_points))
	if available_points == 0:
		pass
	else:
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)

func LoadStats():
	player_strength_value = player.strength
	strength_value.set_text(str(player_strength_value))
	player_vitality_value = player.vitality
	vitality_value.set_text(str(player_vitality_value))
	player_dexterity_value = player.dexterity
	dexterity_value.set_text(str(player_dexterity_value))
	player_agility_value = player.agility
	agility_value.set_text(str(player_agility_value))
	player_spirit_value = player.spirit
	spirit_value.set_text(str(player_spirit_value))
	player_charisma_value = player.charisma
	charisma_value.set_text(str(player_charisma_value))
	player_health_value = player.max_health
	max_hp_value.set_text(str(player_health_value))
	player_health_regen_value = player.health_regen
	hp_regen_value.set_text(str(player_health_regen_value))
	player_mana_value = player.max_mana
	max_mp_value.set_text(str(player_mana_value))
	player_mana_regen_value = player.mana_regen
	mp_regen_value.set_text(str(player_mana_regen_value))
	player_stamina_value = player.max_stamina
	max_sp_value.set_text(str(player_stamina_value))
	player_stamina_regen_value = player.stamina_regen
	sp_regen_value.set_text(str(player_stamina_regen_value))
	
	player_physical_attack_value = player.physical_attack
	physical_attack_value.set_text(str(player_physical_attack_value))
	
	player_physical_defense_value = player.physical_defense
	physical_defense_value.set_text(str(player_physical_defense_value))
	
	player_critical_chance_value = player.critical_chance
	critical_value.set_text(str(player_critical_chance_value))
	player_evasion_chance_value = player.evasion_chance
	
	player_action_speed_value = player.action_speed
	
	player_magic_attack_value = player.magic_attack
	
	player_magic_defense_value = player.magic_defense
	
	player_minion_power_value = player.minion_power
	
	player_effect_duration_value = player.effect_duration
	
	player_cast_speed_value = player.cast_speed

func CalculateDerivedStats():
	player.physical_attack = (player.strength * 2) + (player.dexterity * 1)
	player.physical_defense = (player.vitality * 2) + (player.strength * 1) 
	player.critical_chance = (player.dexterity * 1/4) + (player.strength * 1/5)
	player.evasion_chance = (player.agility * 2) + (player.dexterity * 1)
	player.action_speed = 100 + (player.agility * 1) + (player.dexterity * 1/2)
	player.magic_attack = (player.spirit * 3)
	player.magic_defense = (player.spirit * 2) + (player.charisma * 1)
	player.minion_power = (player.charisma * 2) + (player.spirit * 1)
	player.effect_duration = (player.charisma * 1/2)
	player.cast_speed = 100 + (player.dexterity * 1) + (player.spirit * 1/2)

func _on_confirm_pressed():
	if str_add + vit_add + dex_add + agi_add + spr_add + cha_add == 0:
		print("You confirmed nothing!")
	else:
		player.stat_points = available_points
		player.strength += str_add
		player.vitality += vit_add
		player.dexterity += dex_add
		player.agility += agi_add
		player.spirit += spr_add
		player.charisma += cha_add
		str_add = 0
		vit_add = 0
		dex_add = 0
		agi_add = 0
		spr_add = 0
		cha_add = 0
		CalculateDerivedStats()
		LoadStats()
		for button in get_tree().get_nodes_in_group("MinusButtons"):
			button.set_disabled(true)
		for label in get_tree().get_nodes_in_group("ChangeLabels"):
			label.set_text("")
		




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
	if vit_add > 0:
		vit_add -= 1 # Decrease the stat in code
		available_points += 1 # increase the available stat points in code
		vitality_change.set_text("+ " + str(vit_add)) # increase the available stat points on the str label
		stat_points_label.set_text(str(available_points)) # set the avaiable stat points on the stat points label
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)
	if vit_add == 0:
		vitality_change.set_text(" ") # update the change label
		vitality_minus.disabled = true # if the change value is = 0, lock the minus button

func _on_dexterity_minus_pressed():
	print("Dexterity - 1")
	if dex_add > 0:
		dex_add -= 1 # Decrease the stat in code
		available_points += 1 # increase the available stat points in code
		dexterity_change.set_text("+ " + str(dex_add)) # increase the available stat points on the str label
		stat_points_label.set_text(str(available_points)) # set the avaiable stat points on the stat points label
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)
	if dex_add == 0:
		dexterity_change.set_text(" ") # update the change label
		dexterity_minus.disabled = true # if the change value is = 0, lock the minus button

func _on_agility_minus_pressed():
	print("Agility - 1")
	if agi_add > 0:
		agi_add -= 1 # Decrease the stat in code
		available_points += 1 # increase the available stat points in code
		agility_change.set_text("+ " + str(agi_add)) # increase the available stat points on the str label
		stat_points_label.set_text(str(available_points)) # set the avaiable stat points on the stat points label
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)
	if agi_add == 0:
		agility_change.set_text(" ") # update the change label
		agility_minus.disabled = true # if the change value is = 0, lock the minus button

func _on_spirit_minus_pressed():
	print("Spirit - 1")
	if spr_add > 0:
		spr_add -= 1 # Decrease the stat in code
		available_points += 1 # increase the available stat points in code
		spirit_change.set_text("+ " + str(spr_add)) # increase the available stat points on the str label
		stat_points_label.set_text(str(available_points)) # set the avaiable stat points on the stat points label
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)
	if spr_add == 0:
		spirit_change.set_text(" ") # update the change label
		spirit_minus.disabled = true # if the change value is = 0, lock the minus button

func _on_charisma_minus_pressed():
	print("Charisma - 1")
	if cha_add > 0:
		cha_add -= 1 # Decrease the stat in code
		available_points += 1 # increase the available stat points in code
		charisma_change.set_text("+ " + str(cha_add)) # increase the available stat points on the str label
		stat_points_label.set_text(str(available_points)) # set the avaiable stat points on the stat points label
		for button in get_tree().get_nodes_in_group("PlusButtons"):
			button.set_disabled(false)
	if cha_add == 0:
		charisma_change.set_text(" ") # update the change label
		charisma_minus.disabled = true # if the change value is = 0, lock the minus button



