extends Node2D

var clothing_scores = {
	"Top Hat": 10,
	"Tweed": 5,
	"Clown Vest": 25,
	"Queen Hat": 25,
	"Swimsuit": 15,
	"Stinky Cowboy": -100
}

func _on_cloakroom_stage_ready(hat, suit):
	$Cloakroom.visible = false
	$Circus.visible = true
	$Circus.do_start()
	$Circus.basic_scoring(clothing_scores.get(hat, 0) + clothing_scores.get(suit, 0))
