extends CanvasLayer

@onready var hp_bar = $StatBars/VitalStats/HPBar
@onready var player = $"../player"


# Called when the node enters the scene tree for the first time.
func _ready():
	hp_bar.max_value = player.max_health
	hp_bar.value = player.current_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	UpdateHealth()


func UpdateHealth():
	hp_bar.value = player.current_health
	
