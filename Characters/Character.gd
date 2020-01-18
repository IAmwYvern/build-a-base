extends KinematicBody2D
class_name Character

#Basic character script. All creatures will inherit from this script

const TILE_SIZE = 16
const FLOOR_NORMAL = Vector2.ZERO
const BASE_SPEED = 5
const BASE_ACCEL = 0.2

#STATS
export(int) var max_hp = 1
export(int) var mana = 1
export(int) var strength = 1







