extends Area2D
class_name Knight

var life = 3

@export var SPEED = 150
@onready  var _animation_player = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	global_position.x -= SPEED * delta
	_animation_player.play("walk")

func take_damage():
	life -= 1
	if life <= 0:
		Score._kill_Knight()
		queue_free()
		
func destroy():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Pirate:
		body.updateLife()
		destroy()
