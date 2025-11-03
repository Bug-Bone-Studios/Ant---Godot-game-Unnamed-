extends Node2D
class_name AttackComponent

# Handles damage logic for entities or objects. Use with HealthComponent and HitboxComponent.

var attack_damage: float

# Called when the node enters the scene. Validates attack_damage and prepares for use.
func _ready():
	if attack_damage <= 0:
		print("Warning: attack_damage is set to 0 or less. Defaulting to 10.")
		attack_damage = 10.0

# Sets the attack damage dynamically, ensuring it's a valid value.
# Parameters:
# - damage (float): The new damage value to assign.
func set_attack_damage(damage: float):
	if damage <= 0:
		print("Error: attack_damage must be greater than 0. Value not updated.")
		return
		
	attack_damage = damage
