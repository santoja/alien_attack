extends Control

@onready var score: Label = $Score
@onready var lifes: Label = $Lifes


func set_score_label(new_score) -> void:
	score.text = "Score: " + str(new_score)

func set_lifes_left(amount) -> void:
	lifes.text = str(amount)
