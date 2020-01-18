extends Control

onready var lifebar_hit = $Lifebar/LifebarHit

func init(max_hp):
	$Lifebar/Lifebar.max_value = max_hp
	$Lifebar/Lifebar.value = max_hp
	$Lifebar/LifebarHit.max_value = max_hp
	$Lifebar/LifebarHit.value = max_hp

func _on_Player_took_damage(damage, current_health):
	$Lifebar/Lifebar.value -= damage
	$Lifebar/HitAnimation.interpolate_property(lifebar_hit,"value",lifebar_hit.value,current_health, 1 ,Tween.TRANS_SINE,Tween.EASE_OUT,0.0)
	$Lifebar/HitAnimation.start()
		
