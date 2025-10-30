extends Resource
class_name Entities

@export var speed: float = 0
@export var max_health: float = 0
@export var current_health: float = 0.0

func take_damage(amount: float) -> void:
	current_health = clamp(current_health - amount, 0, max_health)

func heal(amount: float) -> void:
	current_health = clamp(current_health + amount, 0, max_health)
