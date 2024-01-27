extends Node2D

var likelyhood:int = 0
var rng = RandomNumberGenerator.new()
var timer:float = 0
var randomTimer = 0

func _ready():
	rng.randomize()
	randomTimer=rng.randf_range(-.3,1.0)

func _process(delta):
	timer+=delta
	if timer>1+randomTimer:
		timer=0
		if rng.randi_range(1,100) < likelyhood:
			var instance = preload("res://Assets/Flashes/basesflash.tscn").instantiate()
			instance.position = position;
			add_child(instance)

func set_likelyhood(new_likelyhood):
	likelyhood = new_likelyhood
	print(likelyhood)
