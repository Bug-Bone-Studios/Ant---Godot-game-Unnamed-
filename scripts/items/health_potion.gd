extends Node2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	var parent_entity = area.get_parent()
	
	if not parent_entity.is_in_group("player"):
		return

	parent_entity.player_stats.heal(10)
