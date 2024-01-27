extends Node2D

func _on_cloakroom_stage_ready(_hat, _suit):
	$Cloakroom.visible = false
	$Circus.visible = true
	$Circus.do_start()
