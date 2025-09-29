extends Area2D

@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	var game_manager = get_tree().root.get_node("RootNode/GameManager")
	game_manager.show_death_message()
	body.velocity.y = -300.0
	
	var body_colision : CollisionShape2D = body.get_node("CollisionShape2D")
	body_colision.queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
