extends AudioStreamPlayer

func _ready():
	print("life sound")


func _on_finished():
	print("dead sound")
	queue_free()

