extends Node2D
# Instructions for setting up a new weapon:
# 1. Create a new Node2D scene to represent your weapon.
# 2. Add a Shape (e.g., CollisionShape2D) and Visuals (e.g., Sprite2D) to your weapon node.
# 3. Drag the WeaponComponent into the scene and assign the weapon's damage value in the Inspector.
# 4. Create an Area2D node to serve as the weapon's hitbox, e.g., Weaponname_Hitbox.
# 5. Add a CollisionShape2D to the Weaponname_Hitbox and configure it
# 6. Signal your new Weaponname_Hitbox to Weaponname script and call deal_damage on your $WeaponComponent
# 7. Make sure your parameters in this signal function can only be of type HitboxComponent (area: HitboxComponent)

class_name WeaponComponent

# Redeclare this value in your new weapon instance in the Inspector.
@export var attack_damage : float

func _ready() -> void:
	# Prints the name of the parent node, helpful for debugging.
	print("Loading WeaponComponent: ", get_parent().name)

# Deals damage to a hitbox area.
func deal_damage(area): # area (Area2D): The area that the weapon will collide with (e.g., a hitbox).
	# Ensure the area is a valid HitboxComponent.
	var hitbox : HitboxComponent = area
	var attack = AttackComponent.new()
	attack.attack_damage = attack_damage  # Assign the weapon's damage value to the attack.

	# Deal damage by calling the damage method on the hitbox.
	hitbox.damage(attack)
