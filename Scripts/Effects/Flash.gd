extends Node2D

@onready var color_sprite: Sprite2D = $'.'

var timer:float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=delta
	scale = scale + scale*20*delta
	color_sprite.modulate.a-=delta
	if timer>2 :
		print("dead")
		queue_free()
