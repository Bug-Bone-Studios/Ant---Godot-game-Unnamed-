extends Node2D
class_name StaminaComponent

@export var max_stamina: float = 10.0
@export var drain_per_sec: float = 3.0
@export var regen_per_sec: float = 2.0
@export var use_input: bool = true

var stamina: float
var sprinting: bool = false

func _ready() -> void:
	if max_stamina <= 0.0:
		max_stamina = 10.0
	stamina = max_stamina

func _physics_process(delta: float) -> void:
	if use_input:
		sprinting = Input.is_action_pressed("sprint") and stamina > 0.0

	if sprinting:
		stamina -= drain_per_sec * delta
	else:
		stamina += regen_per_sec * delta

	stamina = clamp(stamina, 0.0, max_stamina)

	if stamina <= 0.0:
		sprinting = false
