extends Character

var motion = Vector2()

func _get_input():
	if Input.is_action_pressed("move_right"):
		motion.x = speed * TILE_SIZE 
	elif Input.is_action_pressed("move_left"):
		motion.x = -speed * TILE_SIZE 
	else:
		motion.x = lerp(motion.x, 0, 0.25)
		motion.y = lerp(motion.y, 0, 0.25)

func _physics_process(delta):
	
	_get_input()
	move_and_slide(motion)

	
	