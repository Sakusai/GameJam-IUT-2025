extends Node2D

var spawn_positions = null

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
		spawn_ennemy()
