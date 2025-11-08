extends CharacterBody2D
class_name test_enemy

@export var debug_mode: bool = false

func _ready() -> void:
	if debug_mode:
		print("Loading ", name)
