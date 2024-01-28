extends Node2D

signal do_score(count: int)
signal start_showing()
signal hiding()

@export var ball: PackedScene
var is_hiding: bool = false

func _ready():
	add_5_balls()

func _process(delta):
	for follow in $Path.get_children():
		follow.progress_ratio += delta * 0.5
	
func add_5_balls(count: bool = false):
	for i in [0, 0.2, 0.4, 0.6, 0.8]:
		add_ball(i)
	if count:
		do_score.emit(5)
		
func add_ball(progress: float = 0.0):
	if $Path.get_children().size() > 50:
		return
	var follow = PathFollow2D.new()
	var b = ball.instantiate()
	b.connect('clicked', self._on_ball_clicked)
	b.scale *= 0.1
	follow.set_deferred('progress_ratio', progress)
	follow.add_child(b)
	$Path.add_child(follow)
	if 0 == $Path.get_children().size() % 20:
		do_score.emit(5)
	
func drop_all_balls():
	do_score.emit($Path.get_children().size() * 10)
	for follow in $Path.get_children():
		_on_ball_clicked(follow.get_child(0), false)
	
func _on_ball_clicked(clicked_ball: Node2D, count: bool = true):
	var follow = clicked_ball.get_parent()
	follow.remove_child(clicked_ball)
	clicked_ball.position = follow.position
	add_child(clicked_ball)
	$Path.remove_child(follow)
	follow.queue_free()
	clicked_ball.drop()
	if count:
		do_score.emit(3)
	
func is_hidden():
	return !visible or is_hiding
	
func do_hide():
	hiding.emit()
	is_hiding = true
	drop_all_balls()
	$AnimatedSprite2D.visible = false
	$HideTimer.start()
	
func do_show():
	start_showing.emit()
	is_hiding = false
	$AnimatedSprite2D.visible = true
	visible = true
	$HideTimer.stop()
	
func _on_hide_timer_timeout():
	is_hiding = false
	$AnimatedSprite2D.visible = true
	visible = false


func _on_circus_wear(outfit):
	$AnimatedSprite2D.play(outfit)
