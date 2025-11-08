extends Node2D
class_name HealthComponent

@export var debug_mode:bool = false

# Adds health functionality to entities, allowing them to take damage and be removed at 0 health.

@export var max_health := 10  # Max health, editable in the editor.
var health : float  # Current health, set to Max_Health on startup.

# Validates Max_Health and initializes current health.
func _ready():
	if max_health <= 0:
		print("Warning: Max_Health is set to 0 or less. Defaulting to 10.")
		max_health = 10
	health = max_health
	
	if debug_mode:
		print("Max health of", get_parent().name, " is set to", max_health)

# Reduces health based on incoming attack damage and removes the entity if health is 0 or less.
func damage(attack : AttackComponent):
	if not attack or not typeof(attack) == TYPE_OBJECT:
		print("Error: Invalid attack object passed to damage().")
		return
	if debug_mode:
		print("Damage taken on ", get_parent().name)
	health -= attack.attack_damage
	
	if health <= 0:
		if debug_mode:
			print(get_parent().name, " health set to >= 0, deleting entity")
		queue_free_entity()  # Handles entity removal.

# Handles entity removal safely.
func queue_free_entity():
	var parent = get_parent()
	if parent:
		if debug_mode:
			print("delete successful")
		parent.queue_free()
	else:
		print("Error: No parent to queue_free(). Cannot remove entity.")
