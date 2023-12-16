extends CanvasLayer

@onready var player = $"../player"
@onready var hp_bar = $StatBars/VitalStats/HPBar
@onready var mp_bar = $StatBars/VitalStats/MPBar
@onready var sp_bar = $StatBars/VitalStats/SPBar
@onready var bravery_bar = $StatBars/VitalStats/RadialMeters/BraveryBar
@onready var fatigue_bar = $StatBars/VitalStats/RadialMeters/FatigueBar


func _input(event):
	if event.is_action_pressed("character_sheet"):
		if not has_node("CharacterSheet"):
			var character_sheet = load("res://Scenes/character_sheet.tscn").instantiate()
			add_child(character_sheet)
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) #Locks mouse during gameplay 
			GlobalEvents.can_move = false
		else:
			get_node("CharacterSheet").queue_free()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #Locks mouse during gameplay 
			GlobalEvents.can_move = true


# Called when the node enters the scene tree for the first time.
func _ready():
	hp_bar.max_value = player.max_health
	hp_bar.value = player.current_health
	mp_bar.max_value = player.max_mana
	mp_bar.value = player.current_mana
	sp_bar.max_value = player.max_stamina
	sp_bar.value = player.current_stamina
	bravery_bar.max_value = player.max_bravery
	bravery_bar.value = player.current_bravery
	fatigue_bar.max_value = player.max_fatigue
	fatigue_bar.value = player.current_fatigue

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	UpdateHealth()

func UpdateHealth():
	hp_bar.max_value = player.max_health
	hp_bar.value = player.current_health
	mp_bar.max_value = player.max_mana
	mp_bar.value = player.current_mana
	sp_bar.max_value = player.max_stamina
	sp_bar.value = player.current_stamina
	bravery_bar.max_value = player.max_bravery
	bravery_bar.value = player.current_bravery
	fatigue_bar.max_value = player.max_fatigue
	fatigue_bar.value = player.current_fatigue

