extends Node2D

signal start_clicked()

func _on_start_button_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$AudioStreamPlayer.stop()
		start_clicked.emit()
