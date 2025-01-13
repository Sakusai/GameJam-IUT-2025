extends Area2D
class_name Archer

var life = 2
var is_moving: bool = true
var tir_num = 0

#signal spawn_arrow(location)

@onready var muzzle = $Muzzle

@export var SPEED = 100

func _physics_process(delta: float) -> void:
	if is_moving:
		var direction = Vector2.LEFT
		global_position += direction * SPEED * delta

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

func shoot():
	emit_signal("spawn_arrow", muzzle.global_position)
	
func _on_move_time_timeout() -> void:
	is_moving = not is_moving
	var timer = $MoveTime
	if is_moving:
		timer.wait_time = 2
		timer.start()
	else:
		if tir_num == 0:
			shoot()
			print('arrow')
			timer.wait_time = 1
			timer.start()
			tir_num = 1
		elif tir_num == 1:
			shoot()
			print('arrow')
			timer.wait_time = 1
			timer.start()
			tir_num = 2
		elif tir_num == 2:
			shoot()
			print('arrow')
			timer.wait_time = 1
			timer.start()
			tir_num = 0
