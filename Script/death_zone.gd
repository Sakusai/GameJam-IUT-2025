extends Area2D
class_name DeathZone

	
func _ready():
	$CollisionShape2D.disabled = false

func _on_area_entered(area) -> void:
	print('entré')
	if area is Knight:
		EnemySpawner.updateNbSpawn()
		area.destroy()


func _on_body_entered(body) -> void:
	print('entré')
	if body is Goblin:
		EnemySpawner.updateNbSpawn()
		body.destroy()
