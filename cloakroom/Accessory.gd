extends CharacterBody2D

signal dropped

var is_grabbed: bool = false
var grabbed_offset: Vector2
var original_position: Vector2
@export var type: String = ''

func _ready():
	original_position = Vector2(position)

func input(viewport, event, _shape_idx):
	var mouse_position: Vector2 = get_global_mouse_position()
	if event is InputEventMouseButton:
		is_grabbed = event.pressed
		grabbed_offset = position - mouse_position
		if not event.pressed:
			dropped.emit(type, position)
	viewport.set_input_as_handled()

func _process(delta):
	if is_grabbed and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position = get_global_mouse_position() + grabbed_offset
	elif position.distance_to(original_position) > 20:
		position += position.direction_to(original_position) * 1000 * delta
	else:
		position = Vector2(original_position)
