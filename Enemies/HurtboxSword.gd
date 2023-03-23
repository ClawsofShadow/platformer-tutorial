class_name HurtboxSword
extends Area2D



func _init() -> void:
	collision_layer = 0
	collision_mask = 3


func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(hitbox: HitboxSword) -> void:
	if hitbox == null:
		return


	if owner.method("take_damage"):
		owner.take_damage(hitbox.damage)
