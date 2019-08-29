extends Area2D

func _on_Next_Level_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://MyScenes/Level 03.tscn")
