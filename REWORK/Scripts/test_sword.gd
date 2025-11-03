extends Node2D

func _on_sword_hitbox_area_entered(area: Area2D) -> void:
	$WeaponComponent.deal_damage(area)
