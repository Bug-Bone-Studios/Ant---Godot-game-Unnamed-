extends Node2D

var parent: Node = null

func _ready() -> void:
	parent = get_parent()

func _on_sword_hitbox_area_entered(area: HitboxComponent) -> void:
	# Ensure we only deal damage if the area isn't from the same parent
	if area.get_parent() != parent and is_in_group("enemy") or is_in_group("player"):
		$WeaponComponent.deal_damage(area)
