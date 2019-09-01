extends Area2D

func _on_Danger_Zones_body_entered(body):
	if body.is_in_group("Player"):
		body.die()
