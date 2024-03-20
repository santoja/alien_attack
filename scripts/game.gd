extends Node2D

@export var player_lifes := 3
@export var enemy_damage := 1
@export var score_per_kill := 100
var score := 0

@onready var player: CharacterBody2D = $Player
@onready var hud: Control = $CanvasLayer/HUD
@onready var enemy_hit_sound: AudioStreamPlayer = $EnemyHitSound
@onready var player_take_damage: AudioStreamPlayer = $PlayerTakeDamage

const GAME_OVER_SCREEN = preload("res://ui/game_over_screen.tscn")

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.queue_free()

func _on_player_took_damage() -> void:
	player_lifes -= enemy_damage
	hud.set_lifes_left(player_lifes)
	player_take_damage.play()
	if player_lifes == 0:
		game_over()

func _on_enemy_spawner_enemy_spawned(enemy_instance: Enemy) -> void:
	enemy_instance.connect("died", on_enemy_died)
	add_child(enemy_instance)
	
func on_enemy_died() -> void:
	score += score_per_kill
	hud.set_score_label(score)
	enemy_hit_sound.play()

func game_over() -> void:
	player.die()
	await get_tree().create_timer(1.5).timeout
	var new_game_over = GAME_OVER_SCREEN.instantiate()
	hud.add_child(new_game_over)
	new_game_over.set_score(score)


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance: EnemyPath) -> void:
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", on_enemy_died)
	
