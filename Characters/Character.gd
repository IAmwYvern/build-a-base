extends KinematicBody2D
class_name Character

#Basic character script. All creatures will inherit from this script

const TILE_SIZE = 16
const FLOOR_NORMAL = Vector2.ZERO
const BASE_SPEED = 5
const BASE_ACCEL = 0.2

#STATS
export var max_hp : int
export var max_mana : int
export var strength : int
export var dexterity : int
export var mining : int
export var stamina : int







