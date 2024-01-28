extends Node2D

signal flashes(new_likelyhood:int)
signal audience_excited(excited:bool)
signal audience_very_excited(very_excited:bool)
signal start()

var score: int = 0

func do_start():
	start.emit()
	flashes.emit(1)
	$Descore.start()

func basic_scoring(count: int):
	score += count
	update_audience()
	
func update_audience():
	print(score)
	audience_excited.emit(score > 500)
	audience_excited.emit(score > 1500)
	flashes.emit(score / 25)


func _on_descore_timeout():
	basic_scoring(-10)
