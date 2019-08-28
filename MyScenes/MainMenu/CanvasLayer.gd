extends CanvasLayer

func _enter_tree():
	$ScoreBox/HBoxContainer/Score.text = str(global.coins)
	$HeartBox/HBoxContainer/Health.text = str(global.lives)
	
func update_score(value):
    $ScoreBox/HBoxContainer/Score.text = str(value)
	
func update_heart(value):
    $HeartBox/HBoxContainer/Health.text = str(value)
	
