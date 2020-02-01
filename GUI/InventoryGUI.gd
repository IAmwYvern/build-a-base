extends Control

onready var ItemsContainer = $MarginContainer/TextureRect/MarginContainer/VBoxContainer/Items/GridContainer
onready var BackpackContainer = $MarginContainer/TextureRect/MarginContainer/VBoxContainer/BackpackContainer/GridContainer

var items:Array = []

onready var item_button_scene = preload("res://GUI/ItemButton.tscn")

func _ready():
	_init_item_slots()
	_init_backpack_slots(5)
	visible = false
	
func _init_item_slots():
	for i in ItemsContainer.columns :
		var item_button = item_button_scene.instance()
		ItemsContainer.add_child(item_button)
		item_button.set_item(Item.new(null, 0, null))
		
func _init_backpack_slots(rows):
	for i in BackpackContainer.columns * rows:
		var item_button = item_button_scene.instance()
		BackpackContainer.add_child(item_button)
		item_button.name = str(i)
		item_button.clear()
		if i < 5:
			item_button.set_item(Item.new("sand", 10, load("res://assets/textures/items/sand_block_item.png")))
			items.push_back(item_button.get_item())


	
