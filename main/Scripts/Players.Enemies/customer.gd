extends CharacterBody2D
class_name Customer

var player_nearby := false
@onready var hello_label: Label = $hello_label

func _on_player_detector_area_entered(a: Area2D) -> void:
		if a.is_in_group("player"):
			player_nearby = true
			hello_label.show()

func _on_player_detector_area_exited(a: Area2D) -> void:
		if a.is_in_group("player"):
			player_nearby = true
			hello_label.hide()
