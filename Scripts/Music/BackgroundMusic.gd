extends AudioStreamPlayer

@export var songs: Array[AudioStream] = []

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	play_song()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	play_song()
	pass # Replace with function body.
	
func play_song():
	stream=songs[rng.randi_range(0,songs.size()-1)]
	playing = true
