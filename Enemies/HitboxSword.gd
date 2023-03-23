class_name  HitboxSword
extends Area2D


export var damage := 10


func _init() -> void:
	collision_layer = 3
	collision_mask = 0