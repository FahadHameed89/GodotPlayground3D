extends CanvasLayer

@onready var player = $"../player"
@onready var hp_bar = $StatBars/VitalStats/HPBar
@onready var mp_bar = $StatBars/VitalStats/MPBar
@onready var sp_bar = $StatBars/VitalStats/SPBar
@onready var bravery_bar = $StatBars/VitalStats/RadialMeters/BraveryBar



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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	UpdateHealth()


func UpdateHealth():
	hp_bar.value = player.current_health
	mp_bar.value = player.current_mana
	sp_bar.value = player.current_stamina
	bravery_bar.value = player.current_bravery
