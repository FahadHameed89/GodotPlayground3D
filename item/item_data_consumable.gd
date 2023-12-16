extends ItemData
class_name ItemDataConsumable

@export var heal_value: int
@export var damage_value: int
@export var mp_heal_value: int
@export var mp_cost_value: int
@export var sp_heal_value: int
@export var sp_cost_value: int
@export var stat_point_value: int

func use(target) -> void:

# Positive Effects
	if heal_value != 0:
		target.heal(heal_value)
	if mp_heal_value != 0:
		target.mp_heal(mp_heal_value)
	if sp_heal_value != 0:
		target.sp_heal(sp_heal_value)
	if stat_point_value != 0:
		target.stat_point_gain(stat_point_value)

# Negative effects
	if damage_value != 0:
		target.damage(damage_value)
	if mp_cost_value != 0:
		target.mp_cost(mp_cost_value)
	if mp_cost_value != 0:
		target.sp_cost(sp_cost_value)

