extends Character

#SIGNALS
signal took_damage(damage, current_health)

#CURRENT STATS
var current_hp:int = max_hp

#MOVEMENT 
var velocity = Vector2()
var speed_mod:int = 3
var move_speed:float = TILE_SIZE * BASE_SPEED + speed_mod
var sprint_mod:float = BASE_SPEED + move_speed 

#LEVELING SYSTEM
var level:int = 1
var experience:int = 0
var experience_total:int = 0
var experience_required:int = get_required_experience(level + 1)

func _ready():
	max_hp = 10
	current_hp = 10
	$Camera2D/CanvasLayer/PlayerGUI.init(max_hp)

func _physics_process(delta):
	_get_input()
	if Input.is_action_just_pressed("ui_select"):
		take_damage(1)
		print("ok boomer")
	print(current_hp)
	velocity = move_and_slide(velocity, FLOOR_NORMAL)

func _get_input() -> void:
	var move_direction = Vector2(
		-int(Input.is_action_pressed("move_left")) + int(Input.is_action_pressed("move_right")),
		-int(Input.is_action_pressed("move_up")) + int(Input.is_action_pressed("move_down"))
	)
	var is_sprinting = int(Input.is_action_pressed("sprint"))
	
	#accelerate on the x axis
	velocity.x = lerp(
		velocity.x, 
		(move_speed + (is_sprinting * sprint_mod)) * move_direction.x, 
		BASE_ACCEL
	)
	
	#acelerate on the y axis
	velocity.y = lerp(
		velocity.y, 
		(move_speed + (is_sprinting * sprint_mod)) * move_direction.y, 
		BASE_ACCEL
	)
	
#LEVEL MATHS
func get_required_experience(level):
	return round(pow(level, 2) + level * 4 + 8 )

func gain_experience(amount):
	experience_total += amount
	experience += amount
	if experience >= experience_required:
		level_up()
		
func level_up():
	experience = 0
	level += 1
	experience_required = get_required_experience(level + 1)
	
	max_hp += 5
	strength += 5
	mana += 5
	
func take_damage(damage):
	current_hp -= damage
	emit_signal("took_damage", damage, current_hp)
	