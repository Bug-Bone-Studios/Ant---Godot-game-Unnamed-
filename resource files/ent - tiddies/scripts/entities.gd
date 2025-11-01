extends Resource
class_name Entities

@export var max_health: float = 100
var current_health: float = 100.0

func take_damage(amount: float) -> void:
	current_health = clamp(current_health - amount, 0, max_health)

func heal(amount: float) -> void:
	current_health = clamp(current_health + amount, 0, max_health)
