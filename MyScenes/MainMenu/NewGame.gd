extends Button

func _on_NewGame_pressed():
	global.scene = get_tree().get_current_scene()
	get_tree().change_scene("res://MyScenes/Level 01.tscn")
	