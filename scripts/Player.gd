extends CharacterBody2D

signal took_damage

var speed = 300
@onready var rocket_shot: AudioStreamPlayer = $RocketShot

const ROCKET = preload("res://scenes/rocket.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed 
	move_and_slide()
	fix_outside_screen()

func fix_outside_screen() -> void:
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0, 0), screen_size)

func shoot() -> void:
	var new_rocket = ROCKET.instantiate()
	new_rocket.global_position = global_position
	new_rocket.global_position.x += 80
	rocket_shot.play()
	add_child(new_rocket)
	
func take_damage() -> void:
	emit_signal("took_damage")

func die() -> void:
	queue_free()
