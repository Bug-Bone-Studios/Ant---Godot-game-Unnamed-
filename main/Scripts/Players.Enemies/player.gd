extends CharacterBody2D
class_name Player


@onready var stamina_component: StaminaComponent = $StaminaComponent
@export var enable_movement: bool = true

func _physics_process(_delta: float) -> void:
	if enable_movement:
		playerMovement(_delta)

func playerMovement(_delta: float) -> void:
	## Read WASD input
	var inputVector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * stamina_component.get_current_speed()
	
	# Normalize so diagonals aren't faster
	if inputVector != Vector2.ZERO:
		inputVector = inputVector.normalized()

	move_and_slide()
