extends Area2D
class_name Bullet

var life = 2

var SPEED = 1000

func _physics_process(delta: float) -> void:
	global_position.x += SPEED * delta

func _on_area_entered(area: Area2D) -> void:
	print("area")
	if area.is_in_group("enemies"):
		print("touché")
		area.take_damage()
		EnemySpawner.updateNbSpawn()
		queue_free()
