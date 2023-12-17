extends Node3D

@onready var weapon_animation_player = get_node("%WeaponAnimationPlayer")

var Current_Weapon = null

var Weapon_Stack = [] # An array of weapons currently held by the player

var Weapon_Indicator = 0

var Next_Weapon: String

var Weapon_List = {}

@export var _weapon_resources: Array[Weapon_Resource]

@export var Start_Weapons: Array[String]

func _ready():
	Initialize(Start_Weapons) # Enter the state machine
	
func _input(event):
	if event.is_action_pressed("weapon_up"):
		Weapon_Indicator = min(Weapon_Indicator+1, Weapon_Stack.size()-1)
		exit(Weapon_Stack[Weapon_Indicator])

	if event.is_action_pressed("weapon_down"):
		Weapon_Indicator = max(Weapon_Indicator-1, 0)
		exit(Weapon_Stack[Weapon_Indicator])

func Initialize(_start_weapons: Array):
	for weapon in _weapon_resources:
		Weapon_List[weapon.Weapon_Name] = weapon
		
	for i in _start_weapons:
		Weapon_Stack.push_back(i) # Add starting weapons
	
	Current_Weapon = Weapon_List[Weapon_Stack[0]]
	enter()
	
func enter():
	# When we enter into a weapon state
	weapon_animation_player.queue(Current_Weapon.Activate_Anim)
	
	
func exit(_next_weapon: String):
	# In order to change weapons, first call exit
	if _next_weapon != Current_Weapon.Weapon_Name:
		if weapon_animation_player.get_current_animation() != Current_Weapon.Deactivate_Anim:
			weapon_animation_player.play(Current_Weapon.Deactivate_Anim)
			Next_Weapon = _next_weapon
	
func Change_Weapon(weapon_name: String):
	Current_Weapon = Weapon_List[weapon_name]
	Next_Weapon = ""
	enter()


func _on_weapon_animation_player_animation_finished(anim_name):
	if anim_name == Current_Weapon.Deactivate_Anim:
		Change_Weapon(Next_Weapon)
