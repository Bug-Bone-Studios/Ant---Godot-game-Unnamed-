extends Resource
class_name PlayerStats

@export var speed: float = 300.0
@export var max_health: float = 100.0
@export var current_health: float = 0.0  # placeholder; will sync below

signal health_changed(current_health, max_health)

func _init() -> void:
	# Makes sure currentHealth starts equal to maxHealth
	current_health = max_health

func take_damage(amount: float) -> void:
	current_health = clamp(current_health - amount, 0, max_health)
	emit_signal("health_changed", current_health, max_health)

func heal(amount: float) -> void:
	current_health = clamp(current_health + amount, 0, max_health)
	emit_signal("health_changed", current_health, max_health)
