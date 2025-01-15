extends Area2D
class_name Goblin

@export var SPEED = 300
var life = 1

@onready var timer = $PointsTimer
var minus = 0

func _physics_process(delta: float) -> void:
	global_position.x -= SPEED * delta
	rotate(-0.2)

func take_damage():
	life -= 1
	if life <= 0:
		Score._kill_goblin(minus)
		queue_free()
		
func destroy():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Pirate:
		body.updateLife()
		destroy()


func _on_points_timer_timeout() -> void:
	minus += 5
