extends CharacterBody2D

@export var base_speed := 400.0
@export var speed_increase := 10.0
@export var max_speed := 800.0

var speed := 0.0
var direction := Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	var c := move_and_collide(velocity * delta)
	if c:
		direction = direction.bounce(c.get_normal()).normalized()
		speed = min(speed + speed_increase, max_speed)

# Serve toward -1 (left) or +1 (right)
func serve(towards: int) -> void:
	global_position = get_parent().get_viewport_rect().size / 2
	speed = base_speed
	var y := randf_range(-0.6, 0.6)
	direction = Vector2(towards, y).normalized()
