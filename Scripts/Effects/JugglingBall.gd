extends Sprite2D

var colors = [
	Color(1.0, 0.0, 0.0, 1.0),
	Color(1.0, 1.0, 0.0, 1.0),
	Color(0.0, 1.0, 0.0, 1.0),
	Color(0.0, 1.0, 1.0, 1.0),
	Color(0.0, 0.0, 1.0, 1.0),
	Color(1.0, 0.0, 1.0, 1.0)
]

func _ready():
	self_modulate = colors[randi() % colors.size()]
