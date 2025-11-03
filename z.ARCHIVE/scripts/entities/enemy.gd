extends CharacterBody2D

@export var enemy_stats: Characters

func _ready() -> void:
	if enemy_stats:
		enemy_stats = enemy_stats.duplicate()
	else:
		push_error("ERROR: No enemy_stats on " + name)

func _on_area_2d_area_entered(area: Area2D) -> void:
	var parent_entity = area.get_parent()
	
	if parent_entity.is_in_group("player"):
		parent_entity.player_stats.take_damage(10)
	
	if parent_entity.is_in_group("weapon"):
		enemy_stats.take_damage(parent_entity.weapon_stats.attack_damage)
