extends Node2D
class_name PongGame

@onready var playable_comp := $PlayableGameComponent
@onready var game_label := $game_label

var player_nearby := false

func _on_player_detector_area_entered(a: Area2D) -> void:
	if a.is_in_group("player"):
		player_nearby = true
		game_label.show()

func _on_player_detector_area_exited(a: Area2D) -> void:
	if a.is_in_group("player"):
		player_nearby = false
		game_label.hide()

func _process(_d: float) -> void:
	if player_nearby and Input.is_action_just_pressed("interact"):
		playable_comp.interact()
