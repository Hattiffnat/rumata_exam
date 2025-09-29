extends Area2D


func _on_body_entered(body: Node2D) -> void:
	var game_manager = get_tree().root.get_node("RootNode/GameManager")
	game_manager.add_point()
	queue_free()
