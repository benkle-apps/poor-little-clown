extends AudioStreamPlayer

@export var sounds: Array[AudioStream] = []

var rng = RandomNumberGenerator.new()

func accesory_clicked():
	print("playing")
	stream = sounds[rng.randi_range(0, sounds.size()-1)]
	play()
