extends Node2D

func do_show(success: bool):
	$Node2D/Winner.visible = success
	$Node2D/Looser.visible = not success
