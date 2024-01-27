extends AudioStreamPlayer

@export var quite:AudioStream
@export var excited:AudioStream

# Called when the node enters the scene tree for the first time.
func _ready():
	stream = quite
	play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	play()
	pass # Replace with function body.


func audience_excited(new_excited):
	if new_excited:
		stream=excited
	else:
		stream=quite


