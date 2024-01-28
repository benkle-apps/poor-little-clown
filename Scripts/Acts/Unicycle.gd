extends Node2D

var rotate_to: int
var angles: Array[int] = [-35, -30, -25, -20, -15, -10, -5, 0, 5, 10, 15, 20, 25, 30, 35]
var started: bool = false
var rim: int = 250

signal do_score(count: int)
signal squek_start()

func do_start():
	squek_start.emit()
	$Timer.start()
	rotate_to = 0
	started = true
	do_score.emit(25)

func _process(delta):
	if not started:
		return
	if rotate_to != rotation_degrees:
		var dir = delta if rotate_to > rotation_degrees else -delta
		rotation_degrees = clamp(rotation_degrees + dir * 25, -35, 35)
		if int(rotate_to) == int(rotation_degrees):
			rotation_degrees = rotate_to
	if abs(rotation_degrees) > 20:
		do_score.emit(1)
	position.x += delta * rotation_degrees * 50
	position.x = clamp(position.x, rim, get_viewport_rect().size.x - rim)

func _on_timer_timeout():
	var limit = 12
	if int(rotate_to) == int(rotation_degrees) and randi() % 20 > 12:
		rotate_to = angles[randi() % angles.size()]
	if position.x == rim:
		rotate_to = 5
	elif position.x == get_viewport_rect().size.x - rim:
		rotate_to = -5
