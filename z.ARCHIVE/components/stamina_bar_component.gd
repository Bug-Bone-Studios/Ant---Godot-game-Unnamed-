extends ProgressBar
#class_name StaminaBar

@onready var stamina_bar: StaminaBar = $"."
var stats = null

func _ready() -> void:
	# Defer binding so the parent finishes its _ready() (and any duplicate()) first.
	call_deferred("_bind_stats")

func _bind_stats() -> void:
	var p := get_parent()
	if p:
		if "player_stats" in p:
			stats = p.player_stats
		elif "enemy_stats" in p:
			stats = p.enemy_stats
	if stats:
		max_value = stats.max_stamina
		value = stats.current_stamina
	else:
		push_warning("StaminaBar: no stats found on parent")
		
func _process(_delta: float) -> void:
	stamina_bar.value = stats.current_stamina
