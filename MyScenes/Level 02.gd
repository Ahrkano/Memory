extends Node2D

func _ready():
	$ScoreBox/HBoxContainer/Score.text  = str(global.coins) 
	$ScoreBox/HBoxContainer/Health.text = str(global.lives)
