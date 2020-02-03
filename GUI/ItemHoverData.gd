extends Node

var inventory_item_hover : Item

func _on_item_set_hover(current_item):
	print("hover succesful!")
	if not current_item is Item:
		return
	else:
		self.inventory_item_hover = Item.new(
			current_item.name,
			current_item.quantity,
			current_item.texture
		)
	if current_item.name == "" :
		if current_item.quantity == 0 :
			if current_item.texture == null :
				self.inventory_item_hover = null
				return
	print(inventory_item_hover)

	