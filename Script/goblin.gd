extends Area2D
class_name Goblin

@export var SPEED = 300
var life = 1

func _physics_process(delta: float) -> void:
	global_position.x -= SPEED * delta
	rotate(-0.2)

func take_damage():
	life -= 1
	if life <= 0:
		Score._kill_goblin()
		queue_free()
		
func destroy():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Pirate:
		body.updateLife()
		destroy()
