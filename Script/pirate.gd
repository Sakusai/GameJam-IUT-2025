extends CharacterBody2D
class_name Pirate

signal spawn_bullet(location)
@onready var muzzle = $Muzzle

const SPEED = 500.0
var life = 3
var input_vector = Vector2.ZERO
func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	global_position += input_vector * SPEED * delta
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func updateLife():
	life -= 1
	if life <= 0:
		queue_free()

func shoot():
	emit_signal("spawn_bullet", muzzle.global_position)
