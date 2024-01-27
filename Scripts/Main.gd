extends Node2D

func _on_cloakroom_stage_ready(hat, suit):
	$Cloakroom.visible = false
	$Circus.visible = true
	$Circus.do_start()
