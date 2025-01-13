extends CharacterBody2D


@export var SPEED = 300
func _physics_process(delta: float) -> void:
	global_position.x -= SPEED * delta
	rotate(-0.5)
