extends Node2D

@export var weapon_stats: Weapon


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if weapon_stats != null:
		weapon_stats = weapon_stats.duplicate()
	else:
		push_error("ERROR: No weapon_stats on " + name)
