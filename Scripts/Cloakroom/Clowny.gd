extends Node2D

var blink_timeout: float = 0

func blink():
	if $Body/Blink.visible and blink_timeout < 0.1:
		$Body/Blink.visible = false
	elif not $Body/Blink.visible and randi() % 20 > 16:
		$Body/Blink.visible = true
		blink_timeout = 0.5
	else:
		blink_timeout -= 0.1

func _on_suit_clicked(clicked_suit: CharacterBody2D, chosen: bool):
	for hat in $Suits.get_children():
		hat.visible = false
	if chosen:
		if clicked_suit.id == 'Clown Vest':
			$Suits/ClownVest.visible = true
		if clicked_suit.id == 'Tweed':
			$Suits/Tweed.visible = true
		if clicked_suit.id == 'Swimsuit':
			$Suits/SwimSuit.visible = true

func _on_hat_clicked(clicked_hat: CharacterBody2D, chosen: bool):
	for hat in $Hats.get_children():
		hat.visible = false
	if chosen:
		if clicked_hat.id == 'Queen Hat':
			$Hats/QueenHat.visible = true
		if clicked_hat.id == 'Stinky Cowboy':
			$Hats/StinkyCowboy.visible = true
		if clicked_hat.id == 'Top Hat':
			$Hats/TopHat.visible = true
