extends CollisionShape2D

func _ready():
	pass # Replace with function body.


func _on_Plat_High_tree_entered(body):
	if body.is_in_group("Player").get_node("../../../Player").ladder_on == true :
		CollisionShape2D.set_trigger(false)
