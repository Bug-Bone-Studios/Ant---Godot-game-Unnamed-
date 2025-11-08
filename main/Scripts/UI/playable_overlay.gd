extends CanvasLayer

var game_instance: Node

func _ready() -> void:
	# Let this overlay keep processing even when the main game is paused
	process_mode = Node.PROCESS_MODE_ALWAYS

func set_playable_game(scene: PackedScene) -> void:
	if scene == null:
		push_error("PlayableOverlay: null scene")
		return

	# Remove anything previously loaded (safety)
	for c in get_children():
		c.queue_free()

	# Spawn the mini-game fullscreen inside this CanvasLayer
	game_instance = scene.instantiate()
	add_child(game_instance)

func _unhandled_input(e: InputEvent) -> void:
	if e.is_action_pressed("ui_cancel"):
		queue_free()
		get_tree().paused = false
