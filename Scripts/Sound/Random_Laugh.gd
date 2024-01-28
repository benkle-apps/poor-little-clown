extends AudioStreamPlayer

@export var laughs: Array[AudioStream] = []
@export var on:bool = false
var rng = RandomNumberGenerator.new()

var timer:float = 0

func _process(delta):
	if on:
		timer+=delta*rng.randf_range(1,10)
		if timer>50:
			var instance:AudioStreamPlayer = preload("res://Assets/Sounds/sound_effect.tscn").instantiate()
			instance.stream = laughs[rng.randf_range(0,laughs.size()-1)]
			instance.play()
			add_child(instance)
			timer = 0
		

func audience_very_excited(very_excited):
	on = very_excited
