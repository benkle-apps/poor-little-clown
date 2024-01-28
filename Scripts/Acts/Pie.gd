extends Node2D

signal pie_has_hit()
signal pie_has_flung()
signal pie_fling_finished()
signal do_score(count: int)
var pie_is_flying: bool = false

func fling_da_pie():
	pie_has_flung.emit()
	$Pied.frame = 0
	$Pied.stop()
	$Pied.visible = false
	$Pie/Follow.progress_ratio = 0
	$Pie/Follow/Sprite.scale = Vector2(2, 2)
	$Pie/Follow/Sprite.visible = true
	pie_is_flying = true

func _process(delta):
	if pie_is_flying:
		$Pie/Follow.progress_ratio += delta
		var scale: int = 2 - 0.5 * $Pie/Follow.progress_ratio
		$Pie/Follow/Sprite.scale = Vector2(scale, scale)
		if $Pie/Follow.progress_ratio > 0.95:
			splat()
			
func splat():
	pie_is_flying = false
	pie_has_hit.emit()
	$Pied.visible = true
	$Pie/Follow/Sprite.visible = false
	$Pied.play('default')
	do_score.emit(200)

func _on_pied_animation_finished():
	pie_fling_finished.emit()
