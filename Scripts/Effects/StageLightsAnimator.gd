extends Node2D

@export var lightsColors: Array[Color] = []
@export var changeTimes: Array[float] = []

var front
var mid
var back

var timer:float = 0
var nextColor:int = 0
var nextTimer:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	front = get_node("ViewersFront")
	mid = get_node("ViewersMid")
	back = get_node("ViewersBack")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer-=delta

	if timer < 0 :
		nextTimer+=1
		nextColor+=1
		
		var nextColorLocal = fmod(nextColor, lightsColors.size())
		var nextTimerLocal = fmod(nextTimer, changeTimes.size())
		
		timer=changeTimes[nextTimerLocal]
		
		front.lightsColor = lightsColors[nextColorLocal]
		mid.lightsColor = lightsColors[nextColorLocal]
		back.lightsColor = lightsColors[nextColorLocal]
		
		front.colorChange = true
		mid.colorChange = true
		back.colorChange = true
		
	pass
