extends Entities
class_name Characters

@export var walk_speed: float = 300
@export var run_speed: float = 600

@export var max_stamina: float = 100
var current_stamina: float = 100
var stamina_drain_per_sec: float = 50
var stam_regen_rate_per_sec: float = 20.0 # Rate at which stamina regenerates per second
var stam_regen_enabled: bool = false # Flag that determines if stamina should currently be regenerating

func sprint(amount: float) -> void:
	current_stamina = clamp(current_stamina - amount, 0, max_stamina)
