extends Node2D

var hats: Array[CharacterBody2D]

func _ready():
	hats = [$Sprites/QueenHat, $Sprites/StinkyCowboy, $Sprites/TopHat]

func _on_hat_clicked(clicked_hat: CharacterBody2D, chosen: bool):
	print(clicked_hat.type, chosen)
	for hat in hats:
		if hat != clicked_hat:
			hat.unselect()
