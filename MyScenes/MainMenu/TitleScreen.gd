extends Control

func _ready():
	$AudioStreamPlayer.play()

func _on_NewGame_pressed():
	global.lives = 3
	global.coins = 0
	$press.play()
	get_tree().change_scene("res://MyScenes/Level 01.tscn")


func _on_Continue_pressed():
	$press.play()


func _on_Options_pressed():
	$press.play()


func _on_Quit_pressed():
	get_tree().quit()
