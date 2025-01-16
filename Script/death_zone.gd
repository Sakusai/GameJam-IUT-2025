extends Area2D
class_name DeathZone

signal damage_pirate()
	
func _ready():
	$CollisionShape2D.disabled = false

func _on_area_entered(area) -> void:
	print('entré')
	if area is Knight or area is Goblin:
		emit_signal("damage_pirate")
		EnemySpawner.updateNbSpawn()
		area.destroy()
