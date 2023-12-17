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
	
	
func exit():
	# In order to change weapons, first call exit
	pass
	
func Change_Weapon():
	pass
