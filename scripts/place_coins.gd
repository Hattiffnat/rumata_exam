extends Node2D


@onready var world: Node2D = $"../world"

var Coin = preload("res://scenes/coin.tscn")

func _ready() -> void:
	var grass : TileMapLayer = world.get_node("Tiles/grass")
	
	var generated_coins : Array[Vector2i] = []
	while len(generated_coins) < 30:
		var x = randi() % world.WIDTH
		var y = randi() % world.HEIGHT
		
		if Vector2i(x, y) in generated_coins:
			continue
		
		var tile_above = grass.get_cell_tile_data(Vector2i(x, y - 1))
		var tile_to_place = grass.get_cell_tile_data(Vector2i(x, y))
		var tile_below = grass.get_cell_tile_data(Vector2i(x, y + 1))
		
		if tile_to_place != null or tile_below == null or tile_above != null:
			continue
			
		var coin : Area2D = Coin.instantiate()
		
		var coord = Vector2i(x * 32 + 16, y * 32 + 16)
		
		coin.position =coord
		
		add_child(coin)
		generated_coins.append(Vector2i(x, y))
