extends CharacterBody2D

@export var player_stats: Entities
@export var enable_movement: bool = true
@onready var stamina_regen_timer: Timer = $stamina_bar_component/stamina_regen_timer

@export var regen_rate_per_sec: float = 20.0 # Rate at which stamina regenerates per second
var _regen_enabled: bool = false # Flag that determines if stamina should currently be regenerating

func _ready() -> void:
	# Makes a copy of the resource file PlayerStats 
	# so each player can have their own unique stats instance
	if player_stats != null:
		player_stats = player_stats.duplicate()
	else:
		print("ERROR: No PlayerStats")
	
	# Ensure the timer behaves as a cooldown (one-shot so it only fires once)
	stamina_regen_timer.one_shot = true

	# Safely connect timer signal (prevents duplicate connections)
	if not stamina_regen_timer.timeout.is_connected(_on_stamina_regen_timer_timeout):
		stamina_regen_timer.timeout.connect(_on_stamina_regen_timer_timeout)

func _physics_process(_delta: float) -> void:
	# Only handle movement if movement is enabled
	# (useful for menus, cutscenes, stun effects, etc.)
	if enable_movement:
		playerMovement(_delta)
	
	# Gradually regenerate stamina after cooldown period has ended
	if _regen_enabled and player_stats.current_stamina < player_stats.max_stamina:
		player_stats.current_stamina = min(
			player_stats.max_stamina,
			player_stats.current_stamina + regen_rate_per_sec * _delta
		)
		# Once fully regenerated, stop regen to prevent unnecessary processing
		if player_stats.current_stamina >= player_stats.max_stamina:
			_regen_enabled = false

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

	# Apply movement speed from PlayerStats, and handle sprint
	var sprinting := Input.is_action_pressed("sprint") and inputVector != Vector2.ZERO

	if sprinting and player_stats.current_stamina > 0:
		# Use run speed when sprinting and stamina is available
		velocity = inputVector * player_stats.run_speed

		# Deduct stamina based on drain rate over time
		player_stats.sprint(player_stats.stamina_drain_per_sec * _delta)

		# Disable stamina regeneration while sprinting
		_regen_enabled = false

		# Stop any regen cooldown timer currently running
		if stamina_regen_timer.time_left > 0:
			stamina_regen_timer.stop()

		# If stamina is depleted, fall back to walk speed
		if player_stats.current_stamina <= 0:
			velocity = inputVector * player_stats.walk_speed
	else:
		# Normal walking speed when not sprinting
		velocity = inputVector * player_stats.walk_speed

		# Start regen cooldown only when stamina isn't full and not already regenerating
		if player_stats.current_stamina < player_stats.max_stamina \
		and stamina_regen_timer.time_left <= 0 \
		and not _regen_enabled:
			stamina_regen_timer.start()  # Starts one-shot cooldown before regen begins

	# Use move_and_slide for smooth top-down character movement
	move_and_slide()


# Called when the stamina regen timer finishes its cooldown delay
func _on_stamina_regen_timer_timeout() -> void:
	# Enables stamina regeneration logic in _physics_process
	_regen_enabled = true
