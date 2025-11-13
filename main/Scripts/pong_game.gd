extends Node2D
class_name PongGame

@onready var playable_comp := $PlayableGameComponent
@onready var game_label := $game_label
@onready var player_detector: PlayerDetector = $PlayerDetector

@export var debug_mode:bool = false

func _ready() -> void:
	game_label.hide()

	if player_detector == null:
		push_warning("PlayerDetector is not assigned at $PlayerDetector")
		return
	elif debug_mode:
		print("PlayerDetector is assigned to pong_game")

	player_detector.player_presence_changed.connect(_on_presence_changed)

func _on_presence_changed(nearby: bool) -> void:
	game_label.visible = nearby

func _process(_delta: float) -> void:
	if player_detector != null \
		and player_detector.player_nearby \
		and Input.is_action_just_pressed("interact"):
		print("PongGame: interact pressed, calling playable_comp.interact()")
		playable_comp.interact()
