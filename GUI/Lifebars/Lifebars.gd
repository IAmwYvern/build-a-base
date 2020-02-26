extends Control

onready var lifebar_hit = $Lifebar/LifebarHit

var safe_zone:int
var caution_zone:int
var danger_zone:int

export(Color) var safe_zone_color
export(Color) var caution_zone_color
export(Color) var danger_zone_color
export(Color) var danger_zone_hit_color

func init(max_hp):
	$Lifebar/Lifebar.max_value = max_hp
	$Lifebar/Lifebar.value = max_hp
	$Lifebar/LifebarHit.max_value = max_hp
	$Lifebar/LifebarHit.value = max_hp
	
	safe_zone = max_hp - round((max_hp / 3))
	caution_zone = max_hp - round(2*(max_hp/3))
	danger_zone = 0

func _on_Player_took_damage(damage, current_health):
	$Lifebar/Lifebar.value -= damage
	$Lifebar/HitAnimation.interpolate_property(lifebar_hit,"value",lifebar_hit.value,current_health, 1 ,Tween.TRANS_SINE,Tween.EASE_OUT,0.0)
	$Lifebar/HitAnimation.start()
	
	if current_health >= safe_zone:
		$Lifebar/Lifebar.tint_progress = safe_zone_color
	elif current_health <= safe_zone and current_health >= caution_zone:
		$Lifebar/Lifebar.tint_progress = caution_zone_color
	else:
		$Lifebar/Lifebar.tint_progress = danger_zone_color
		$Lifebar/LifebarHit.tint_progress = danger_zone_hit_color
		
