extends Area2D
class_name Arrow

var SPEED = 400

func _physics_process(delta: float) -> void:
	global_position.x -= SPEED * delta

func _on_body_entered(body: Node2D) -> void:
	if body is Pirate:
		body.updateLife()
		queue_free()
		print(body.life)
