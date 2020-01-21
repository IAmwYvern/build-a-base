extends Node

var blocks_data

func _ready():
	_import_blocks()
	
func _import_blocks():
	var blocks_file = File.new()
	blocks_file.open("res://importData/Blocks.json", File.READ)
	var blocks_json = JSON.parse(blocks_file.get_as_text())
	blocks_file.close()
	blocks_data = blocks_json.result
	print(blocks_data)