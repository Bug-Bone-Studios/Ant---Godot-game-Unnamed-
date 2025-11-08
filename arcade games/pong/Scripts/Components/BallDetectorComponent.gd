extends Area2D
class_name BallDetectorComponent

@export var side: int = -1
signal goal_scored(side: int)

func _on_area_entered(_area: Area2D) -> void:
	$Timer.start()

func _on_timer_timeout() -> void:
	emit_signal("goal_scored", side)
