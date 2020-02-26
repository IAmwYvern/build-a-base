extends TextureRect

class_name Item


var item_name : String
var item_texture : Texture
var item_rarity
var item_slot

var quantity : int

func _init(_item_name, _item_texture, _item_rarity):
	item_name = _item_name
	item_texture = _item_texture
	item_rarity = _item_rarity
	quantity = 1