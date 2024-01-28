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
	$Score.text = str(score)
	audience_excited.emit(score > 500)
	audience_very_excited.emit(score > 1000)
	flashes.emit(score / 75)


func _on_descore_timeout():
	basic_scoring(-50)
