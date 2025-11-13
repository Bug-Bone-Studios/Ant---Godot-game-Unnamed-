extends Control
class_name PlayableOverlay

@onready var viewport_container: SubViewportContainer = $SubViewportContainer
@onready var viewport: SubViewport = $SubViewportContainer/SubViewport

func _ready() -> void:
	visible = true

	# 🔹 Keep this overlay alive even when the tree is paused
	process_mode = Node.PROCESS_MODE_ALWAYS
	viewport.process_mode = Node.PROCESS_MODE_ALWAYS

	if viewport.size == Vector2i.ZERO:
		viewport.size = get_viewport().size

	print("PlayableOverlay: ready, viewport size:", viewport.size)


func set_playable_game(scene: PackedScene) -> void:
	if scene == null:
		push_warning("PlayableOverlay: scene is null in set_playable_game()")
		return

	print("PlayableOverlay: set_playable_game called")

	var game_root := scene.instantiate()

	# 🔹 Mini-game also ignores pause
	game_root.process_mode = Node.PROCESS_MODE_ALWAYS

	viewport.add_child(game_root)

	print("PlayableOverlay: added mini-game:", game_root)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		print("PlayableOverlay: closing on ui_cancel")

		# unpause the world when we close the mini-game
		get_tree().paused = false
		queue_free()
