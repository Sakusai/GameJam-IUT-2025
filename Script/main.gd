extends Node2D
class_name Main

var Bullet = preload("res://Scene/bullet.tscn")



func _on_pirate_spawn_bullet(location: Variant) -> void:
	print("shoot")
	var b = Bullet.instantiate()
	b.global_position = location
	add_child(b)
