extends Area2D

class_name Enemy

@export var speed := 200
signal died

func _physics_process(delta: float) -> void:
	global_position.x -= speed*delta

func die() -> void:
	emit_signal("died")
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.take_damage()
	die()
	

