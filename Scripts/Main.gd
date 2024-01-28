extends Node2D

var clothing_scores = {
	"tophat": 10,
	"tweed": 5,
	"clownvest": 25,
	"queenhat": 25,
	"swimsuit": 15,
	"stinky": -100,
	"naked": 0
}

func _on_cloakroom_stage_ready(hat, suit):
	$Cloakroom.visible = false
	$Circus.visible = true
	$Circus.do_start(suit + '_' + hat)
	$Circus.basic_scoring(clothing_scores.get(hat, 0) + clothing_scores.get(suit, 0))
