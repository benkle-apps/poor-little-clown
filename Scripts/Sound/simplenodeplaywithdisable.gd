extends AudioStreamPlayer

var active:bool = false

func play_sound():
	if active:
		play()

func stop_sound():
	stop()

func disable(_s:bool=false):
	active = false
	
func enable():
	active = true

func toggle():
	active = !active
