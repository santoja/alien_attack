extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

const ENEMY = preload("res://scenes/enemy.tscn")
const PATH_ENEMY = preload("res://scenes/path_enemy.tscn")

@onready var spawn_position: Node2D = $SpawnPosition



func _on_timer_timeout() -> void:
	spawn_enemy()
	

func spawn_enemy() -> void:
	var spawn_position_array = spawn_position.get_children()
	var random_spawn_position = spawn_position_array.pick_random()
	
	var new_enemy = ENEMY.instantiate()
	new_enemy.global_position = random_spawn_position.global_position
	emit_signal("enemy_spawned", new_enemy)


func _on_path_enemy_timer_timeout() -> void:
	spawn_path_enemy()

func spawn_path_enemy() -> void:
	var path_enemy_instance = PATH_ENEMY.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
	
