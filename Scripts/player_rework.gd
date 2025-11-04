extends CharacterBody2D
class_name Player

@export var enable_movement: bool = true

func _physics_process(_delta: float) -> void:
	# Only handle movement if movement is enabled
	if enable_movement:
		playerMovement(_delta)

func playerMovement(_delta: float) -> void:
	## Read WASD input
	var inputVector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * 300 #300 is player speed for now
	
	# Normalize so diagonals aren't faster
	if inputVector != Vector2.ZERO:
		inputVector = inputVector.normalized()


	# Use move_and_slide for smooth top-down character movement
	move_and_slide()
