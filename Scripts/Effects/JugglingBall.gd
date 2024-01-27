extends Node2D

signal clicked(ball: Node2D)

var dropped: bool = false
var drop_direction: Vector2
var colors = [
	Color(1.0, 0.0, 0.0, 1.0),
	Color(1.0, 1.0, 0.0, 1.0),
	Color(0.0, 1.0, 0.0, 1.0),
	Color(0.0, 1.0, 1.0, 1.0),
	Color(0.0, 0.0, 1.0, 1.0),
	Color(1.0, 0.0, 1.0, 1.0)
]

func _ready():
	$Ball/Sprite.self_modulate = colors[randi() % colors.size()]

func _on_ball_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and not dropped:
		clicked.emit(self)
		
func drop():
	drop_direction = position.direction_to(Vector2(
		randi() % int(get_viewport_rect().size.x),
		randi() % int(get_viewport_rect().size.y)
	))
	dropped = true

func _process(delta):
	if dropped:
		position += drop_direction * delta * 1000
