extends CharacterBody2D

enum Types {Hat, Suit}

@export var type: Types
@export var id: String

signal accessory_clicked(type: CharacterBody2D, chosen: bool)

func _on_input_event(viewport: Viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		accessory_clicked.emit(self, $Sprite.visible)
		$Sprite.visible = not $Sprite.visible
		viewport.set_input_as_handled()
		
func unselect():
	$Sprite.visible = true
