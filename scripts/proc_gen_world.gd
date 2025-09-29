extends Node2D

# Размер игровой карты
var WIDTH : int = 50
var HEIGHT : int = 30

@onready var grass_layer = $Tiles/grass
	
var source_id : int = 0
var grass_co = Vector2i(0, 0)

@export var noise_height_texture : NoiseTexture2D
var noise : Noise

func _ready() -> void:
	noise = noise_height_texture.noise
	generate_world()

func generate_world():
	# Вычисляем максимальное и минимальное значение для нормализации
	var noise_min : float
	var noise_max : float
		
	for x in range(WIDTH):
		for y in range(HEIGHT):
			var noise_val : float = noise.get_noise_2d(x, y)
			noise_min = min(noise_min, noise_val)
			noise_max = max(noise_max, noise_val)	
	var delta = noise_max - noise_min
	
	for x in range(WIDTH):
		for y in range(HEIGHT):
			# Нормализуем значение
			var noise_val : float = ( noise.get_noise_2d(x, y) - noise_min ) / delta
			
			# По пороговому значению ставим тот или иной тайл
			if noise_val > 0.5 :
				grass_layer.set_cell(Vector2i(x, y), source_id, grass_co)
	
