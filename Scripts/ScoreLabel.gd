extends Label

func _ready():
	var font = preload('res://Assets/Font/Redkost Comic.otf')
	add_theme_font_override('font', font)
