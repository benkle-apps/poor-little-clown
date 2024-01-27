extends AudioStreamPlayer

@export var sounds: Array[AudioStream] = []

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func accesory_clicked():
	print("playing")
	stream = sounds[rng.randi_range(0, sounds.size()-1)]
	play()
