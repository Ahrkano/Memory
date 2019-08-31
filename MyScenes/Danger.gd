extends Area2D

func _ready():
	pass # Replace with function body.


func _on_Danger_zones_body_entered(body):
	if body.is_in_group("Player"):
		body.die()
