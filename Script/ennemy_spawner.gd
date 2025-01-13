extends Node2D
class_name EnemySpawner
var spawn_positions = null
static var nbspawn = 0
var Enemy = [preload("res://Scene/knight.tscn"), 
		preload("res://Scene/Goblin.tscn"), 
		preload("res://Scene/Archer.tscn")
	]

func _ready() -> void:
	randomize()
	spawn_positions = $SpawnPositions.get_children()


func spawn_ennemy():
	var indexEnemy = randi() % Enemy.size()
	var indexPosition = randi() % spawn_positions.size()
	var enemy = Enemy[indexEnemy].instantiate()
	enemy.global_position  = spawn_positions[indexPosition].global_position 
	add_child(enemy)

func _on_spawntimer_timeout() -> void:
	print(nbspawn)
	if nbspawn <= 5:
		spawn_ennemy()
		nbspawn +=1
		print(nbspawn)

static func updateNbSpawn():
	nbspawn -=1
