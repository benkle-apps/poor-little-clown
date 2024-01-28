extends Node2D

signal flashes(new_likelyhood:int)
signal audience_excited(excited:bool)
signal audience_very_excited(very_excited:bool)
signal start()
signal stop()
signal wear(outfit: String)
signal game_over(success: bool)

var score: int = 0

func do_start(outfit: String):
	wear.emit(outfit)
	start.emit()
	flashes.emit(1)
	$Descore.start()
	
func do_stop():
	$Descore.stop()
	flashes.emit(0)
	audience_excited.emit(false)
	audience_very_excited.emit(false)
	stop.emit()

func basic_scoring(count: int):
	score += count
	update_audience()
	
func update_audience():
	$Score.text = str(score)
	audience_excited.emit(score > 500)
	audience_very_excited.emit(score > 1000)
	flashes.emit(score / 75)
	if score <= -1500:
		game_over.emit(false)
		do_stop()
	if score >= 2000:
		game_over.emit(true)
		do_stop()


func _on_descore_timeout():
	basic_scoring(-50)
