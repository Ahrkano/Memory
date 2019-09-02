extends Area2D


func _on_Next_Level_3_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://MyScenes/MainMenu/Credits.tscn")