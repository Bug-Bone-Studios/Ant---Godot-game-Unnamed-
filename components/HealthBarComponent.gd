extends ProgressBar
class_name HealthBar

@onready var damage_bar: ProgressBar = $damage_bar
@onready var timer: Timer = $Timer

var stats = null
var health: float = 0.0 : set = set_health

func _ready() -> void:
	# Automatically grab the parent's stats resource
	var parent = get_parent()
	if parent != null:
		if "player_stats" in parent:
			stats = parent.player_stats
		elif "enemy_stats" in parent:
			stats = parent.enemy_stats
	else:
		print("Parent of Health Bar Component is null")

	# Initialize the bar once we have stats
	if stats != null:
		init_health(stats.max_health)

func init_health(_health: float) -> void:
	health = _health
	max_value = health
	value = health
	damage_bar.max_value = health
	damage_bar.value = health

func set_health(new_health: float) -> void:
	var prev_health: float = health
	health = min(max_value, new_health)
	value = health

	if health < prev_health:
		timer.start()
	else:
		damage_bar.value = health

func _on_timer_timeout() -> void:
	damage_bar.value = health
