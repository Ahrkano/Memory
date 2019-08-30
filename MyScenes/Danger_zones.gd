extends Area2D

func _on_Danger_zones_body_entered(body):
	if body.is_in_group("Player"):
		body.die()
		#get_tree().reload_current_scene()
		
