extends Area2D

export var value = 1

func _ready():
	pass # Replace with function body.

func _on_HP_body_entered(body):
	if body.is_in_group("Player"):
		body.HeartGrabbed(value)
		queue_free()

