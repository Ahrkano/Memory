extends Area2D

export var value = 1

func _on_Silver_Coin_body_entered(body):
		if body.is_in_group("Player"):
			body.CoinGrabbed(value)
			queue_free()
