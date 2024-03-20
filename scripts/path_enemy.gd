extends Path2D

class_name EnemyPath

@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var enemy: Area2D = $PathFollow2D/Enemy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow_2d.progress_ratio += 0.25 * delta
	if path_follow_2d.progress_ratio <= 0:
		queue_free()
