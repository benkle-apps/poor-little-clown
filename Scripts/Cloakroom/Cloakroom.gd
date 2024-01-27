extends Node2D

@export var selected_hat: String = ''
@export var selected_suit: String = ''

signal stage_ready(hat: String, suit: String)
signal accesory_clicked()

func _on_hat_clicked(clicked_hat: CharacterBody2D, chosen: bool):
	accesory_clicked.emit()
	for hat in $Room/Hats.get_children():
		if hat != clicked_hat:
			hat.unselect()
	selected_hat = clicked_hat.id if chosen else ''

func _on_suit_clicked(clicked_suit: CharacterBody2D, chosen: bool):
	accesory_clicked.emit()
	for suit in $Room/Suits.get_children():
		if suit != clicked_suit:
			suit.unselect()
	selected_suit = clicked_suit.id if chosen else ''
	
func _ready_for_stage():
	stage_ready.emit(selected_hat, selected_suit)

func _on_go_button(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		_ready_for_stage()
