extends Area2D

func _on_Hitbox_body_entered(body: Node):
	if body is Player:
		body.player_die()
