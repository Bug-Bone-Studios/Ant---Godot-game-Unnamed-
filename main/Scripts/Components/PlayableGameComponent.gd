extends Node2D

@export var playable_scene: PackedScene                         # e.g. Pong.tscn
const PLAYABLE_OVERLAY := preload("res://main/Scenes/UI/playable_overlay.tscn")

func interact() -> void:
	var overlay := PLAYABLE_OVERLAY.instantiate()
	get_tree().root.add_child(overlay)          # draw above world
	overlay.set_playable_game(playable_scene)   # mount mini-game
	get_tree().paused = true                    # pause world
