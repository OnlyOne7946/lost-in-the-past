extends Node

var health: int = 100
var stamina: int = 100
var inventory = []
var player_node: Node = null
@onready var inventory_slot_scene = preload("res://scenes/inventory/inventory_slot.tscn")
signal inventory_updated

func _ready():
	inventory.resize(30)

func add_item(item):
	for i in range(inventory.size()):
		# Check if the item exists in the inventory and matches both type and effect
		if inventory[i] != null and inventory[i]["type"] == item["type"] and inventory[i]["effect"] == item["effect"]:
			inventory[i]["quantity"] += item["quantity"]
			inventory_updated.emit()
			print("Item added", inventory)
			return true
		elif inventory[i] == null:
			inventory[i] = item
			inventory_updated.emit()
			print("Item added", inventory)
			return true
	return false

func remove_item():
	# Реализуйте логику удаления предмета из инвентаря
	inventory_updated.emit()

func increase_inventory_size():
	# Реализуйте логику увеличения размера инвентаря
	inventory_updated.emit()

func set_player_reference(player: Node):
	player_node = player
