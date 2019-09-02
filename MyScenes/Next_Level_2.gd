extends Area2D

func _on_Next_Level_body_entered(body):
	if body.is_in_group("Player"):
		global.scene = get_node("res://MyScenes/Level 02.tscn")
		get_tree().change_scene("res://MyScenes/Level 03.tscn")
