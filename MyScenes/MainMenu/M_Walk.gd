extends AnimatedSprite
	
var direction            = 1
var currentSpeed         = 50

func _process(delta):
	if position.x < 300 or position.x > get_viewport().size.x - 300:
		direction = -direction
		if position.x > get_viewport().size.x - 300 :
			flip_h = true
		else:
			flip_h = false

	walk(delta)
	
func walk(delta):
	position.x = position.x + (currentSpeed * delta * direction)