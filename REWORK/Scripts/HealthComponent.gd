extends Node2D
class_name HealthComponent

# Adds health functionality to entities, allowing them to take damage and be removed at 0 health.

@export var Max_Health := 10  # Max health, editable in the editor.
var health : float  # Current health, set to Max_Health on startup.

# Validates Max_Health and initializes current health.
func _ready():
	if Max_Health <= 0:
		print("Warning: Max_Health is set to 0 or less. Defaulting to 10.")
		Max_Health = 10
	health = Max_Health

# Reduces health based on incoming attack damage and removes the entity if health is 0 or less.
func damage(attack : AttackComponent):
	if not attack or not typeof(attack) == TYPE_OBJECT:
		print("Error: Invalid attack object passed to damage().")
		return
	
	health -= attack.attack_damage
	
	if health <= 0:
		queue_free_entity()  # Handles entity removal.

# Handles entity removal safely.
func queue_free_entity():
	var parent = get_parent()
	if parent:
		parent.queue_free()
	else:
		print("Error: No parent to queue_free(). Cannot remove entity.")
