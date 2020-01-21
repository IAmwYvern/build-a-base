extends TextureButton

signal quantity_changed(qty)

func set_qty(amount):
	$QuantityLabel.text = str(amount)
	emit_signal("quantity_changed", amount)
	
func set_texture(newTexture : ImageTexture):
	$ItemTexture.texture = newTexture

func _on_ItemButton_quantity_changed(qty):
	if qty == 0 :
		$QuantityLabel.text = " "
