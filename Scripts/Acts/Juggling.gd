extends Node2D

signal ball_dropped(drop_count: int)
signal ball_added(add_count: int)

@export var ball: PackedScene

func _ready():
	add_5_balls()

func _process(delta):
	for follow in $Path.get_children():
		follow.progress_ratio += delta * 0.5
	
func add_5_balls():
	for i in [0, 0.2, 0.4, 0.6, 0.8]:
		add_ball(i)
	ball_added.emit(5)
		
func add_ball(progress: float = 0.0):
	var follow = PathFollow2D.new()
	var b = ball.instantiate()
	b.connect('clicked', self._on_ball_clicked)
	b.scale *= 0.1
	follow.set_deferred('progress_ratio', progress)
	follow.add_child(b)
	$Path.add_child(follow)
	ball_added.emit(1)
	
func drop_all_balls():
	ball_dropped.emit($Path.get_children().size() * 10)
	for follow in $Path.get_children():
		_on_ball_clicked(follow.get_child(0))
	
func _on_ball_clicked(clicked_ball: Node2D):
	var follow = clicked_ball.get_parent()
	follow.remove_child(clicked_ball)
	clicked_ball.position = follow.position
	add_child(clicked_ball)
	$Path.remove_child(follow)
	follow.queue_free()
	clicked_ball.drop()
	ball_dropped.emit(1)