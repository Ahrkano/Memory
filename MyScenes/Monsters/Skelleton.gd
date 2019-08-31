extends Area2D

func _ready():
	$AnimatedSprite.playing = false
	$AnimatedSprite.animation = "Rise"
	$AnimatedSprite.set_frame(0) 

func _on_Skelleton_body_entered(body):
	if body.is_in_group("Player"):
		$AnimatedSprite.playing = true
		yield(get_tree().create_timer(4), "timeout")
		$AnimatedSprite.animation = "Walk"
		print(position)
		walk_around(position.x, true, false)
		

		
func walk_around(pos, left, right):
	var center = pos
	var step = 0
	while step < 20:
		print (position.x)
		print (center)
		if position.x > center - 50  and left == true :
			position.x -= 10
		else:
			if position.x < center + 50 and right == true:
				position.x += 10
				
		if position.x == center - 50 :
			left = false
			right = true
			$AnimatedSprite.flip_h = true
		if position.x == center + 50 :
			right = false
			left = true
			$AnimatedSprite.flip_h = false
			
		yield(get_tree().create_timer(1), "timeout")	
		step += 1
	queue_free()	
	 
