extends Area2D
class_name PlayerDetector

signal player_presence_changed(nearby: bool)

var player_nearby := false

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _on_area_entered(a: Area2D) -> void:
	if a.is_in_group("player"):
		_set_player_nearby(true)

func _on_area_exited(a: Area2D) -> void:
	if a.is_in_group("player"):
		_set_player_nearby(false)

func _set_player_nearby(v: bool) -> void:
	if player_nearby == v:
		return
	player_nearby = v
	player_presence_changed.emit(player_nearby)
