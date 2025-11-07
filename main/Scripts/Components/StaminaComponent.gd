extends Node2D
class_name StaminaComponent

@export_range(1.0, 1000.0, 0.1) var max_stamina: float = 10.0
@export_range(0.0, 100.0, 0.1) var drain_per_sec: float = 3.0
@export_range(0.0, 100.0, 0.1) var regen_per_sec: float = 2.0
@export var use_input: bool = true

@export_range(0.0, 5000.0, 1.0) var base_speed: float = 200.0
@export_range(1.0, 5.0, 0.05) var sprint_multiplier: float = 1.1

var stamina: float
var sprinting: bool = false
var exhausted: bool = false

func _ready() -> void:
	if max_stamina <= 0.0:
		max_stamina = 10.0
	stamina = max_stamina

func _physics_process(delta: float) -> void:
	# Clamp first so decisions use valid range
	stamina = clamp(stamina, 0.0, max_stamina)

	if use_input:
		# can only start/continue sprinting if not exhausted and we have stamina
		var wants_sprint := Input.is_action_pressed("sprint")
		sprinting = wants_sprint and not exhausted and stamina > 0.0

	_update_stamina(delta)

	# auto-exhaust when emptied; clear once we regen a bit
	if stamina <= 0.0:
		exhausted = true
		sprinting = false
	elif exhausted and stamina >= max_stamina * 0.2:
		# small threshold to prevent instant re-sprint at 0.01 stamina
		exhausted = false

func _update_stamina(delta: float) -> void:
	if sprinting:
		stamina -= drain_per_sec * delta
	else:
		stamina += regen_per_sec * delta

func get_current_speed() -> float:
	return base_speed * (sprint_multiplier if sprinting else 1.0)
