extends Node2D

func _ready():
	visible = false
	position = Vector2(0, 0)

func _process(delta):
	if get_parent().is_hovering == true:
		position = get_global_mouse_position()
	
func set_item(item : Item):
	if not item.quantity == 0:
		_set_quantity(item.quantity)
	if not item.texture == null:
		_set_texture(item.texture)
	
func _set_quantity(x):
	if not x == 0:
		$Quantity.text = str(x)
func _set_texture(image):
	$Texture.texture = image