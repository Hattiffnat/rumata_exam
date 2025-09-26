extends Node

@onready var score_label : Label = $"../CanvasLayer/score"
@onready var win_label : Label = $"../CanvasLayer/win"

var score = 0

func add_point():
	score += 1
	score_label.text = "{0} / 10".format([score])
	
	if score >= 10:
		win_label.visible = true
