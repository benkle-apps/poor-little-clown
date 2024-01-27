extends Node2D

var hats: Array[CharacterBody2D]
var suits: Array[CharacterBody2D]

func _ready():
	hats = [$Sprites/QueenHat, $Sprites/StinkyCowboy, $Sprites/TopHat]
	suits = [$Sprites/ClownVest, $Sprites/Tweed, $Sprites/SwimSuit]

func _on_hat_clicked(clicked_hat: CharacterBody2D, chosen: bool):
	print(clicked_hat.type, clicked_hat.id, chosen)
	for hat in hats:
		if hat != clicked_hat:
			hat.unselect()

func _on_suit_clicked(clicked_suit: CharacterBody2D, chosen: bool):
	print(clicked_suit.type, clicked_suit.id, chosen)
	for suit in suits:
		if suit != clicked_suit:
			suit.unselect()
