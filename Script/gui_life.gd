extends CanvasLayer

func _ready() -> void:
	show()
	
func _on_pirate_take_damage(life) -> void:
	if life == 2:
		$heart3.hide()
	if life == 1:
		$heart2.hide()
	if life == 0:
		$heart1.hide()


func _on_pirate_death() -> void:
	hide()
