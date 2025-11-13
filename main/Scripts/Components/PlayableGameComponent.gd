extends Node2D
class_name PlayableGameComponent

@export var playable_scene: PackedScene  # e.g. pong_world.tscn

const PLAYABLE_OVERLAY = preload("uid://dq60ybk2o5d7d")

func interact() -> void:
	if playable_scene == null:
		push_warning("PlayableGameComponent: playable_scene is not assigned")
		return

	print("PlayableGameComponent: interact() called")

	var overlay := PLAYABLE_OVERLAY.instantiate()
	get_tree().root.add_child(overlay)        # <– UI goes under root viewport

	overlay.set_playable_game(playable_scene) # tell it which mini-game to mount
	get_tree().paused = true
