extends AudioStreamPlayer

func _on_button_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		play()
