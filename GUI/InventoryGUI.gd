extends Control

onready var ItemsContainer = $MarginContainer/TextureRect/MarginContainer/VBoxContainer/Items/GridContainer
onready var BackpackContainer = $MarginContainer/TextureRect/MarginContainer/VBoxContainer/BackpackContainer/GridContainer

onready var ItemButtonScene = preload("res://GUI/ItemButton.tscn")

func _ready():
	_init_item_slots()
	_init_backpack_slots(6)
	visible = false
	
func _init_item_slots():
	for i in ItemsContainer.columns :
		var item_button = ItemButtonScene.instance()
		ItemsContainer.add_child(item_button)
		item_button.set_qty(0)
		item_button.set_texture(null)
		
func _init_backpack_slots(rows):
	for i in BackpackContainer.columns * rows:
		var item_button = ItemButtonScene.instance()
		BackpackContainer.add_child(item_button)
		item_button.set_qty(0)
		item_button.set_texture(null)	