extends CharacterBody2D
class_name Customer

@onready var hello_label: Label = $hello_label
@onready var player_detector: PlayerDetector = $PlayerDetector
@export var debug_mode:bool = false

func _ready() -> void:
	hello_label.hide()

	if player_detector == null:
		push_warning("PlayerDetector not found at $PlayerDetector")
		return
	
	if debug_mode:
		print("PlayerDetector connected to [Customer]")

	player_detector.player_presence_changed.connect(_on_presence_changed)

func _on_presence_changed(nearby: bool) -> void:
	hello_label.visible = nearby
