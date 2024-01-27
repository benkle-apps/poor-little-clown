extends Node2D

signal flashes(new_likelyhood:int)
signal audience_excited(excited:bool)
signal start()

func do_start():
	start.emit()
	flashes.emit(1)
