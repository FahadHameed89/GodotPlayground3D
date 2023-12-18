extends Node3D

signal Weapon_Changed
signal Update_Ammo
signal Update_Weapon_Stack

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

	if event.is_action_pressed("shoot"):
		shoot()
		
	if event.is_action_pressed("reload"):
		reload()

func Initialize(_start_weapons: Array):
	for weapon in _weapon_resources:
		Weapon_List[weapon.Weapon_Name] = weapon
		
	for i in _start_weapons:
		Weapon_Stack.push_back(i) # Add starting weapons
	
	Current_Weapon = Weapon_List[Weapon_Stack[0]]
	emit_signal("Update_Weapon_Stack", Weapon_Stack)
	enter()
	
func enter():
	# When we enter into a weapon state
	weapon_animation_player.queue(Current_Weapon.Activate_Anim)
	emit_signal("Weapon_Changed", Current_Weapon.Weapon_Name)
	emit_signal("Update_Ammo", [Current_Weapon.Current_Ammo, Current_Weapon.Reserve_Ammo])
	
	
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
		
	if anim_name == Current_Weapon.Shoot_Anim and Current_Weapon.Auto_Fire == true:
		if Input.is_action_pressed("shoot"):
			shoot()

func shoot():
	if Current_Weapon.Current_Ammo != 0:
		if !weapon_animation_player.is_playing(): # Locks fire rate to that of the animation
			weapon_animation_player.play(Current_Weapon.Shoot_Anim)
			Current_Weapon.Current_Ammo -= 1
			emit_signal("Update_Ammo", [Current_Weapon.Current_Ammo, Current_Weapon.Reserve_Ammo])

func reload():
	if Current_Weapon.Current_Ammo == Current_Weapon.Magazine:
		return
	elif !weapon_animation_player.is_playing():
		if Current_Weapon.Reserve_Ammo != 0: # Alternatively, we can check for a global variable if we want to use MP instead of reserve ammo
			weapon_animation_player.play(Current_Weapon.Reload_Anim)
			var Reload_Amount = min(Current_Weapon.Magazine - Current_Weapon.Current_Ammo, Current_Weapon.Magazine, Current_Weapon.Reserve_Ammo) # This checks the lowest of the 3 variables here, so using MP we should reference a global MP variable instead of reserve ammo

			Current_Weapon.Current_Ammo = Current_Weapon.Current_Ammo + Reload_Amount
			Current_Weapon.Reserve_Ammo = Current_Weapon.Reserve_Ammo - Reload_Amount
			
			emit_signal("Update_Ammo", [Current_Weapon.Current_Ammo, Current_Weapon.Reserve_Ammo])
		
		else: 
			weapon_animation_player.play(Current_Weapon.Out_Of_Ammo_Anim)
