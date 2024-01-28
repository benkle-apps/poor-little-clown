extends Node2D

func _juggling_button_pressed(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if $Juggling.is_hidden():
			$Juggling.add_5_balls()
			$Juggling.do_show()
			$Unicycle.visible = false
		else:
			$Juggling.add_ball()
			

func _unicycle_button_pressed(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		$Juggling.do_hide()
		if not $Unicycle.visible:
			$Unicycle.position.x = 535
			$Unicycle.visible = true
		$Unicycle.do_start()
