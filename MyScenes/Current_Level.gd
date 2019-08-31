extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func respawned():
	get_tree().get_nodes_in_group('player')[0].global_position = get_tree().get_nodes_in_group('resp')[0].global_position