extends Node2D

signal flashes(new_likelyhood:int)
# Called when the node enters the scene tree for the first time.
func _ready():
	flashes.emit(20)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
