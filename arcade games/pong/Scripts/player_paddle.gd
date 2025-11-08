extends CharacterBody2D

@export var speed: float = 400.0
var start_x: float

func _ready():
	start_x = position.x  # remember initial X position

func _physics_process(delta):
	var move_y = Input.get_axis("move_up", "move_down") * speed
	velocity = Vector2(0, move_y)
	move_and_slide()

	# lock X so the paddle never drifts horizontally
	position.x = start_x
