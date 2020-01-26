extends TextureButton

signal quantity_changed(qty)

func set_item(Item):
	_set_name(Item.name)
	_set_qty(Item.quantity)
	_set_texture(Item.texture)
	
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
		$QuantityLabel.text = " "
func _on_ItemButton_mouse_entered():
	$NameLabel.visible = true
func _on_ItemButton_mouse_exited():
	$NameLabel.visible = false
	print("ok boomer")
