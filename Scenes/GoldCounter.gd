extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var gold_counter_value = GlobalEvents.current_gold
	text = "Gold: "+str(gold_counter_value)
