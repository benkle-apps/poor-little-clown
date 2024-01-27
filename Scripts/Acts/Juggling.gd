extends Node2D

@export var ball: PackedScene
var is_ready: bool = false

func _ready():
	for i in [0, 0.2, 0.4, 0.6, 0.8]:
		add_ball(i)
	is_ready = true

func _process(delta):
	if is_ready:
		for follow in $Path.get_children():
			follow.progress_ratio += (delta+randf()*0.5)*0.5
		
func add_ball(progress: float = 0.0):
	var follow = PathFollow2D.new()
	var b = ball.instantiate()
	b.scale *= 0.1
	follow.progress_ratio = progress
	follow.add_child(b)
	$Path.add_child(follow)
	
