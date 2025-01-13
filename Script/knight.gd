extends Area2D

@export var SPEED = 150
@onready  var _animation_player = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	global_position.x -= SPEED * delta
	_animation_player.play("walk")
