extends Area2D
class_name DeathZone

	
func _ready():
	$CollisionShape2D.disabled = false

func _on_area_entered(area) -> void:
	print('entré')
	if area is Knight or area is Goblin:
		EnemySpawner.updateNbSpawn()
		area.destroy()
