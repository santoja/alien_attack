extends Control

@onready var score: Label = $Panel/Score

func set_score(new_score) -> void:
	score.text = "SCORE: " + str(new_score)


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()
