extends Node2D

const SPEED = 60

var direction = Vector2(1.0, 1.0)

@onready var ray_cast_up : RayCast2D = $RayCastUp
@onready var ray_cast_down : RayCast2D = $RayCastDown
@onready var ray_cast_left : RayCast2D = $RayCastLeft 
@onready var ray_cast_right : RayCast2D = $RayCastRight

func _process(time_delta: float) -> void:
	if ray_cast_up.is_colliding():
		direction.y = 1.0
	if ray_cast_down.is_colliding():
		direction.y = -1.0
	if ray_cast_left.is_colliding():
		direction.x = 1.0
	if ray_cast_right.is_colliding():
		direction.x = -1.0
	
	position += direction * SPEED * time_delta
