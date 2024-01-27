extends AudioStreamPlayer

@export var quite:AudioStream
@export var excited:AudioStream

func _ready():
	stream = quite

func _on_finished():
	play()

func audience_excited(new_excited):
	if new_excited:
		stream=excited
	else:
		stream=quite
