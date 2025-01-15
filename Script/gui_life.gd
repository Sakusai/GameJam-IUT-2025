extends CanvasLayer

func _on_pirate_take_damage(life) -> void:
	if life == 2:
		$heart3.hide()
	if life == 1:
		$heart2.hide()
	if life == 0:
		$heart1.hide()
