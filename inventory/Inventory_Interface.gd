extends Control
@onready var player_inventory = $PlayerInventory

func set_player_inventory_data(inventory_data: InventoryData) -> void:
	player_inventory.set_inventory_data(inventory_data)
