extends CharacterBody2D

@export var type: String

signal hat_clicked(type: CharacterBody2D, chosen: bool)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		hat_clicked.emit(self, $Sprite.visible)
		$Sprite.visible = not $Sprite.visible
		
func unselect():
	$Sprite.visible = true
