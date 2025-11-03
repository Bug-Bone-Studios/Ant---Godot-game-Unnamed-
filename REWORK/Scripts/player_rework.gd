extends CharacterBody2D

@export var enable_movement: bool = true

func _physics_process(_delta: float) -> void:
	# Only handle movement if movement is enabled
	if enable_movement:
		playerMovement(_delta)

func playerMovement(_delta: float) -> void:
	var inputVector: Vector2 = Vector2.ZERO

	# Read WASD input
	if Input.is_action_pressed("move_right"):
		inputVector.x += 1
	if Input.is_action_pressed("move_left"):
		inputVector.x -= 1
	if Input.is_action_pressed("move_down"):
		inputVector.y += 1
	if Input.is_action_pressed("move_up"):
		inputVector.y -= 1

	# Normalize so diagonals aren't faster
	if inputVector != Vector2.ZERO:
		inputVector = inputVector.normalized()

	velocity = inputVector * 300

	# Use move_and_slide for smooth top-down character movement
	move_and_slide()
