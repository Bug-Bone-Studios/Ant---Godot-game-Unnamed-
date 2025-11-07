extends ProgressBar
class_name StaminaBar

@export var stamina_component : StaminaComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	if not stamina_component:
		print("Warning: StaminaComponent is not assigned to StaminaBarComponent. Stamina will not be displayed on ", get_parent().name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	max_value = stamina_component.max_stamina
	value = stamina_component.stamina
