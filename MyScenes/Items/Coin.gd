extends Node2D
export var value = 1

func _ready():
	pass

func _on_Coin_body_entered(body):
	if body.is_in_group("Player"):
		body.CoinGrabbed(value)
		queue_free()

