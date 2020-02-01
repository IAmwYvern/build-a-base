extends TextureButton

var current_item
var is_hovering = false

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
	if not is_hovering:
		$ItemHover.set_item(current_item)
		$ItemHover.visible = true
		current_item = null
		is_hovering = true
	
