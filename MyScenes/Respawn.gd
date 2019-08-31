extends Area2D


func _on_Respawn_body_entered(body):
	if body.is_in_group('Player'):
		body.respawn = body.global_position