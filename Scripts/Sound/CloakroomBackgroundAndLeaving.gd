extends AudioStreamPlayer

@export var leaving:AudioStream

var active:bool = true

func _on_finished():
	if active:
		play()


func stage_ready(_hat, _suit):
	active=false
	stop()
	stream = leaving
	volume_db=15
	play()
