extends Area2D

func _on_Respawn_body_entered(body):
	if (body.is_in_group('Player')):
		print(body.respawn)
		body.respawn = body.get_global.position()
		print(body.respawn)

