extends Node2D

@export var ball: PackedScene

func _ready():
	for follow in $Path.get_children():
		var b = ball.instantiate()
		b.scale *= 0.1
		follow.add_child(b)

func _process(delta):
	for follow in $Path.get_children():
		follow.progress_ratio += delta*0.5
