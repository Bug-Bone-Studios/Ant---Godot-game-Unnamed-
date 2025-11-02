extends ProgressBar
class_name HealthBar

var stats = null

func _ready() -> void:
	# Wait for parent to finish its setup
	call_deferred("_bind_stats")

func _bind_stats() -> void:
	var p := get_parent()
	if p == null:
		push_warning("HealthBar: no parent found")
		return

	# Try to find either 'player_stats' or 'enemy_stats'
	if "player_stats" in p and p.player_stats:
		stats = p.player_stats
	elif "enemy_stats" in p and p.enemy_stats:
		stats = p.enemy_stats
	else:
		push_warning("HealthBar: no stats found on parent " + str(p.name))
		return

	# Initialize bar values
	max_value = stats.current_health
	value = stats.current_health

func _process(_delta: float) -> void:
	if stats:
		value = stats.current_health
