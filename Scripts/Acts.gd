extends Node2D

func _juggling_button_pressed(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not $Juggling.visible:
			$Juggling.visible = true
		else:
			$Juggling.add_ball()
			
