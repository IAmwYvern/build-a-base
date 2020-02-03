extends TextureButton

var current_item : Item
var is_hovering : bool = false 

signal quantity_changed(qty)
signal item_set_hover(item)

func set_item(Item):
	_set_name(Item.name)
	_set_qty(Item.quantity)
	_set_texture(Item.texture)
	current_item = Item
	
func get_item():
	return current_item
	
func clear():
	current_item = Item.new("", 0, null)
	_set_name("")
	emit_signal("quantity_changed", 0)
	$NameLabel.visible = false
	_set_qty(0)
	_set_texture(null)
	
func _set_name(name):
	if not name == null:
		$NameLabel.text = name
func _set_qty(amount):
	$QuantityLabel.text = str(amount)
	emit_signal("quantity_changed", amount)
func _set_texture(newTexture : Texture):
	$ItemTexture.texture = newTexture

#SIGNALS
func _on_ItemButton_quantity_changed(qty):
	if qty == 0 :
		$QuantityLabel.text = ""
func _on_ItemButton_mouse_entered():
	if not $QuantityLabel.text == "" :
		$NameLabel.visible = true
func _on_ItemButton_mouse_exited():
	if not $QuantityLabel.text == "" :
		$NameLabel.visible = false

func _on_ItemButton_pressed():
	if not ItemHoverData.inventory_item_hover is Reference:
		emit_signal("item_set_hover", current_item)
		$ItemHover.set_item(current_item)
		$ItemHover.visible = true
		is_hovering = true
		clear()