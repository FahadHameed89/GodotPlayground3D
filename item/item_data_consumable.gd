extends ItemData
class_name ItemDataConsumable

@export var heal_value: int
@export var damage_value: int

func use(target) -> void:
	if heal_value != 0:
		target.heal(heal_value)
	if damage_value != 0:
		target.damage(damage_value)
