extends CharacterBody2D
class_name Pirate

signal spawn_bullet(location)
signal take_damage(life)
signal reloading()
signal death()

@onready var muzzle = $Muzzle
@onready var timer = $reload
const SPEED = 500.0
var life = 3
var nbBullet = 6
var input_vector = Vector2.ZERO
var is_reload = false

	
func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	global_position += input_vector * SPEED * delta
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
	if Input.is_action_just_pressed("reload"):
		print("reload")
		reload()

func updateLife():
	life -= 1
	emit_signal("take_damage", life)
	if life <= 0:
		queue_free()
		emit_signal("death")

func shoot():
	if nbBullet>0 and !is_reload:
		nbBullet-=1
		Score._shoot()
		emit_signal("spawn_bullet", muzzle.global_position)

func reload():
	timer.wait_time = 1
	timer.start()
	is_reload= true
	nbBullet = 6
	Score._reload()
	
	
func _on_death_zone_damage_pirate() -> void:
	updateLife()


func _on_reload_timeout() -> void:
	emit_signal("reloading")
	is_reload = false


func _on_control_reload() -> void:
	get_tree().reload_current_scene()
	
