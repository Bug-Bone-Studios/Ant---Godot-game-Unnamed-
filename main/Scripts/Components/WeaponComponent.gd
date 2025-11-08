extends Node2D
class_name WeaponComponent

@export var attack_damage : float
@export var debug_mode: bool = false

func _ready() -> void:
	if debug_mode:
		print("Loading WeaponComponent: ", get_parent().name)

# Deals damage to a hitbox area.
func deal_damage(area):
	# Ensure the area is a valid HitboxComponent.
	var hitbox : HitboxComponent = area
	var attack = AttackComponent.new()
	attack.attack_damage = attack_damage  # Assign the weapon's damage value to the attack.

	hitbox.damage(attack)
