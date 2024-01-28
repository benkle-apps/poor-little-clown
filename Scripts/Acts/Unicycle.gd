extends Node2D

var rotate_to: int
var time_to_exhaustion: float = 0
var started: bool = false
var rim: int = 250
var anti_rim: int

signal do_score(count: int)
signal squek_start()

func _ready():
	anti_rim = get_viewport_rect().size.x - rim

func do_start():
	squek_start.emit()
	rotate_to = 0
	started = true
	do_score.emit(25)

func _process(delta):
	if not started:
		return
	time_to_exhaustion += delta
	rotate_to = clamp((get_global_mouse_position().x - position.x) / 10, -35, 35)
	if rotate_to != rotation_degrees:
		var dir = 1 if rotate_to > rotation_degrees else -1
		var old_lean = sign(rotation_degrees)
		rotation_degrees = clamp(rotation_degrees + dir * delta * 75, -35, 35)
		if sign(rotation_degrees) != old_lean:
			time_to_exhaustion = 0
		if int(rotate_to) == int(rotation_degrees):
			rotation_degrees = rotate_to
	if abs(rotation_degrees) > 10 and time_to_exhaustion < 3:
		do_score.emit(int(abs(rotation_degrees)/10))
	position.x += delta * rotation_degrees * 50
	position.x = clamp(position.x, rim, anti_rim)


func _on_circus_wear(outfit):
	$AnimatedSprite2D.play(outfit)
