extends CanvasLayer

func update_score(value):
    $ScoreBox/HBoxContainer/Score.text = str(value)
	
func update_heart(value):
    $ScoreBox/HBoxContainer/Health.text = str(value)
	
