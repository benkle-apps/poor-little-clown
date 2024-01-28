extends AudioStreamPlayer

@export var quite:AudioStream
@export var excited:AudioStream

var is_excited:bool = false

func _ready():
	stream = quite

func _on_finished():
	print("jo")
	play()

func audience_excited(new_excited):
	if is_excited != new_excited:
		is_excited=new_excited
		if new_excited:
			stream=excited
		else:
			stream=quite
		play()
