extends CharacterBody2D

@export var player_stats: PlayerStats
@export var enable_movement: bool = true
@onready var health_bar: HealthBar = $HealthBarComponent

func _ready() -> void:
	# Makes a copy of the resource file PlayerStats 
	# so each player can have their own unique stats instance
	if player_stats != null:
		player_stats = player_stats.duplicate()
	else:
		print("ERROR: No PlayerStats")

func _physics_process(_delta: float) -> void:
	# Only handle movement if movement is enabled
	# (useful for menus, cutscenes, stun effects, etc.)
	if enable_movement:
		playerMovement()
	
	# Below used for debugging health bar updates
	if Input.is_action_just_pressed("left_click"):
		health_bar.health = player_stats.current_health - 10
		player_stats.current_health = health_bar.health
		print(player_stats.current_health)
	if Input.is_action_just_pressed("right_click"):
		health_bar.health = player_stats.current_health + 10
		player_stats.current_health = health_bar.health
		print(player_stats.current_health)

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

	# Apply movement speed from PlayerStats
	velocity = inputVector * player_stats.speed

	# Use move_and_slide for smooth top-down character movement
	move_and_slide()
