extends Control



func _on_again_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")


func _on_load_pressed() -> void:
	SaveLoad._load()
	


func _on_exit_pressed() -> void:
	get_tree().quit()
