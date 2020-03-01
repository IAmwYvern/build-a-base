extends Node2D

const WIDTH = 2048
const HEIGHT = 2048
const TILE_SIZE = 16
const TILE_INDEX = {
	'dirt' : 0,
	'grass1' : 1,
	'grass2' : 2
}

onready var grass_layer = $Grass_layer

var dirt_treshold : float = 0.10
var grass_variant_treshold : float = -0.25

var open_simplex_noise

func _ready() -> void:
	#generate grass noise map
	randomize()
	open_simplex_noise = OpenSimplexNoise.new()
	open_simplex_noise.seed = randi()
	open_simplex_noise.octaves = 2
	open_simplex_noise.period = 200
	open_simplex_noise.lacunarity = 1
	
	#generate map using noise map
	generate()
	
func generate():
	#generate base grass layer
	for i in HEIGHT:
		for j in WIDTH:
			randomize()
			if rand_range(0.0, 1.0) >= 1 - grass_variant_treshold:
				if j % TILE_SIZE == 0:
					grass_layer.set_cellv(Vector2(j / TILE_SIZE, i / TILE_SIZE), TILE_INDEX.grass2)
				else:
					grass_layer.set_cellv(Vector2(j / TILE_SIZE, i / TILE_SIZE), TILE_INDEX.grass1)
	
	#generate dirt
	for i in HEIGHT:
		for j in WIDTH:
			randomize()
			if j % TILE_SIZE == 0:
				var tile = _get_tile_index(open_simplex_noise.get_noise_2d(float(j), float(i)))
				grass_layer.set_cellv(Vector2(j / TILE_SIZE, i / TILE_SIZE), tile)
						
	grass_layer.update_bitmask_region(Vector2(0, 0), Vector2(WIDTH, HEIGHT))


func _get_tile_index(sample:float):
	if(sample >= dirt_treshold):
		return TILE_INDEX.dirt
	return 1;