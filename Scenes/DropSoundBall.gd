extends AudioStreamPlayer

@export var sounds: Array[AudioStream] = []
var rng = RandomNumberGenerator.new()

func ball_clicked(ball):
	sound()

func sound():
	stream = sounds[rng.randi_range(0, sounds.size()-1)]
	play()


func _on_node_2d_clicked(ball):
	pass # Replace with function body.
