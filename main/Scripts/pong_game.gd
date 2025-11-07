# PongMachine.gd (on the machine node in your world)
extends Node2D

@onready var playable_comp := $PlayableGameComponent
var player_nearby := false

func _on_player_detector_area_entered(a: Area2D) -> void:
	if a.is_in_group("player"): player_nearby = true

func _on_player_detector_area_exited(a: Area2D) -> void:
	if a.is_in_group("player"): player_nearby = false

func _process(_d: float) -> void:
	if player_nearby and Input.is_action_just_pressed("interact"):
		playable_comp.interact()
