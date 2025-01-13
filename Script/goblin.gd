extends CharacterBody2D
class_name Goblin

@export var SPEED = 300
func _physics_process(delta: float) -> void:
	global_position.x -= SPEED * delta
	rotate(-0.5)

func destroy():
	queue_free()
