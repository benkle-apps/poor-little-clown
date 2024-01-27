extends Node2D

@onready var color_sprite: Sprite2D = $'.'
var timer:float = 0

func _process(delta):
	timer+=delta
	rotate(delta)
	scale = scale + scale*20*delta
	color_sprite.modulate.a-=delta
	if timer>2:
		queue_free()
