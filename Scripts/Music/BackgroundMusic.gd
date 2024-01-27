extends AudioStreamPlayer

@export var songs: Array[AudioStream] = []
var rng = RandomNumberGenerator.new()

func _on_finished():
	play_song()
	
func play_song():
	stream=songs[rng.randi_range(0,songs.size()-1)]
	playing = true
