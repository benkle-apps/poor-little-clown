extends Node2D

@export var ball: PackedScene

func _ready():
	add_ball()

func _process(delta):
	for follow in $Path.get_children():
		follow.progress_ratio += delta * 0.5
		
func add_ball(progress: float = 0.0):
	var follow = PathFollow2D.new()
	var b = ball.instantiate()
	b.scale *= 0.1
	follow.progress_ratio = progress
	follow.add_child(b)
	$Path.add_child(follow)
	
