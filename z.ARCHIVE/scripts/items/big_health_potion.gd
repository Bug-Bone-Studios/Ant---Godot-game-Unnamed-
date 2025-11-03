extends health_potion

func _on_player_detector_area_entered(area: Area2D) -> void:
	health_potion._on_area_2d_area_entered(area)
