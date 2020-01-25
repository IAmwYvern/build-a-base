extends TextureButton

signal quantity_changed(qty)

func _ready():
	init(Item.new("test", 5, load("res://items/sand_block_item.png")))

func init(Item):
	set_name(Item.name)
	set_qty(Item.quantity)
	set_texture(Item.texture)
	
func set_name(name):
	$NameLabel.text = name

func set_qty(amount):
	$QuantityLabel.text = str(amount)
	emit_signal("quantity_changed", amount)

func set_texture(newTexture : Texture):
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
