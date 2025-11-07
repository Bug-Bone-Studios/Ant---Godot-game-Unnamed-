extends ProgressBar
class_name HealthBar

@export var health_component : HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	if not health_component:
		print("Warning: HealthComponent is not assigned to HealthBarComponent. health will not be displayed on ", get_parent().name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	max_value = health_component.max_health
	value = health_component.health
