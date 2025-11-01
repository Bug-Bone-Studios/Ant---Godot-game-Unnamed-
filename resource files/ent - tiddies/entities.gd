extends Resource
class_name Entities

@export var walk_speed: float = 300
@export var run_speed: float = 600

@export var max_health: float = 100
@export var current_health: float = 100.0

@export var max_stamina: float = 100
@export var current_stamina: float = 100
var stamina_drain_per_sec: float = 50

func take_damage(amount: float) -> void:
	current_health = clamp(current_health - amount, 0, max_health)

func heal(amount: float) -> void:
	current_health = clamp(current_health + amount, 0, max_health)

func sprint(amount: float) -> void:
	current_stamina = clamp(current_stamina - amount, 0, max_stamina)
