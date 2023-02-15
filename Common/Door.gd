extends Area2D

export(String, FILE, "*.tscn") var target_level_path = ""


func _on_Door_body_entered(body: Node):
	if not body is Player:
		return
		
	if target_level_path.empty():
		return

	yield(Transitions.play_exit_transition(), "completed")
	get_tree().change_scene(target_level_path)
