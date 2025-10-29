extends CharacterBody2D

@export var playerStats: PlayerStats

func _ready() -> void:
	#Makes a copy of the resource file PlayerStats - so each player can have there own stats
	playerStats = playerStats.duplicate()

func _physics_process(_delta: float) -> void:
	playerMovement()

func playerMovement() -> void:
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

	velocity = inputVector * playerStats.speed
	move_and_slide()
