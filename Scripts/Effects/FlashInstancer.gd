extends Node2D

var likelyhood:int = 30
var rng = RandomNumberGenerator.new()
var timer:float = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=delta
	if timer>1:
		timer=0
		if rng.randi_range(1,100) < likelyhood:
			var instance = preload("res://Assets/Flashes/basesflash.tscn").instantiate()
			instance.position = position;
			add_child(instance)
	pass
