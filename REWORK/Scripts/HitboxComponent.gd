extends Area2D
class_name HitboxComponent

# Connects to a HealthComponent to handle damage when hit.
@export var health_component : HealthComponent  # Reference to the associated HealthComponent.

# Ensures the HealthComponent is valid when the node is added to the scene.
func _ready():
	if not health_component:
		print("Warning: HealthComponent is not assigned to HitboxComponent. Damage will not be processed on ", get_parent().name)

# Applies damage from an AttackComponent, passing it to the HealthComponent if valid.
func damage(attack: AttackComponent):
	print("Detecting damage on HitboxComponent: ", get_parent().name)
	if health_component:
		health_component.damage(attack)
	else:
		print("Error: HealthComponent is not assigned. Cannot process damage.")
