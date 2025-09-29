extends Node

const save_location = "user://rumata_save.tres"

var save_file_data : Save = Save.new()

func _ready() -> void:
	_load()

func _save() -> void:
	ResourceSaver.save(save_file_data, save_location)

func _load() -> void:
	if FileAccess.file_exists(save_location):
		save_file_data = ResourceLoader.load(save_location).duplicate(true)
