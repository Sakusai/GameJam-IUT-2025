extends Area2D

var life = 2

func take_damage():
	life -= 1
	if life <= 0:
		queue_free()
		
func destroy():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Pirate:
		body.updateLife()
		destroy()
