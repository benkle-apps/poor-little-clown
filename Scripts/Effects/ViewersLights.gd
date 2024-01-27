extends Sprite2D

@export var lightsColor:Color
@export var colorChange:bool

var r:float = 0
var g:float = 1
var b:float = .5

@onready var color_sprite: Sprite2D = $'.'

func _process(delta):
	if colorChange :
		var localR = abs(fmod(r, 2) - 1)
		var localG = abs(fmod(g, 2) - 1)
		var localB = abs(fmod(b, 2) - 1)
	
		color_sprite.self_modulate = Color(localR, localG, localB)

		var difR = abs(localR - lightsColor.r)
		var difG = abs(localG - lightsColor.g)
		var difB = abs(localB - lightsColor.b)

		var boolR:bool = (0.0 < difR && difR < 0.1)
		var boolG:bool = (0.0 < difG && difG < 0.1)
		var boolB:bool = (0.0 < difB && difB < 0.1)
	
		if !boolR:
			r+=1*delta;
		if !boolG:
			g+=1*delta;
		if !boolB:
			b+=1*delta;
		
		if boolR && boolG && boolB:
			colorChange = false
