extends Node2D
class_name Main

var Bullet = preload("res://Scene/bullet.tscn")

func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE

func _on_pirate_spawn_bullet(location: Variant) -> void:
	print("shoot")
	var b = Bullet.instantiate()
	b.global_position = location
	add_child(b)


func _on_pirate_death() -> void:
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
