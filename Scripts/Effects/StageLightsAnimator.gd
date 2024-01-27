extends Node2D

@export var lightsColors: Array[Color] = []
@export var changeTimes: Array[float] = []
var timer:float = 0
var nextColor:int = 0
var nextTimer:int = 0

func _process(delta):
	timer-=delta

	if timer < 0:
		nextTimer+=1
		nextColor+=1
		
		var nextColorLocal = fmod(nextColor, lightsColors.size())
		var nextTimerLocal = fmod(nextTimer, changeTimes.size())
		
		timer=changeTimes[nextTimerLocal]
		
		$ViewersFront.lightsColor = lightsColors[nextColorLocal]
		$ViewersMid.lightsColor = lightsColors[nextColorLocal]
		$ViewersBack.lightsColor = lightsColors[nextColorLocal]
		
		$ViewersFront.colorChange = true
		$ViewersMid.colorChange = true
		$ViewersBack.colorChange = true
