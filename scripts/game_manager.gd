extends Node

@onready var score_label : Label = $"../CanvasLayer/score"
@onready var win_label : Label = $"../CanvasLayer/win"
@onready var game_over : Label = $"../CanvasLayer/game_over"

@onready var doge: CharacterBody2D = $"../DogeBody"

var score = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("save"):
		SaveLoad.save_file_data.coins = score
		SaveLoad.save_file_data.transform = doge.transform
		SaveLoad._save()
	elif Input.is_action_just_pressed("load"):
		SaveLoad._load()
		score = SaveLoad.save_file_data.coins
		doge.transform = SaveLoad.save_file_data.transform
		
func show_death_message():
	game_over.visible = true

func add_point():
	score += 1
	score_label.text = "{0} / 10".format([score])
	
	if score >= 10:
		win_label.visible = true
	
