extends KinematicBody2D

const UP = Vector2(0,-1)
var move = Vector2()
var crouching = false

export var speedX = 100
export var jumpforce = -300
export var gravity = 9.8
	
		
func _process(delta):
	move.y += gravity 
	
	$AnimatedSprite.playing = true
	
	if Input.is_action_pressed("ui_right"):
		move.x = speedX
		$AnimatedSprite.flip_h = false
		if is_on_floor():
			if Input.is_action_pressed("ui_down"):
				$AnimatedSprite.animation = "Slide"
				$Footstep_grass.stop()
				crouching = false
			else:
				$AnimatedSprite.animation = "Run"
				if not $Footstep_grass.is_playing():
                	$Footstep_grass.play()
		
	elif Input.is_action_pressed("ui_left"):
		move.x = -speedX
		$AnimatedSprite.flip_h = true
		if is_on_floor():
			if Input.is_action_pressed("ui_down"):
				$AnimatedSprite.animation = "Slide"
				$Footstep_grass.stop()
				crouching = false
			else:
				$AnimatedSprite.animation = "Run"
				if not $Footstep_grass.is_playing():
                	$Footstep_grass.play()
		
	else:
		move.x = 0
		if is_on_floor():
			$AnimatedSprite.animation = "Idle"
			$Footstep_grass.stop()
			crouching = false
			
			
		
	
	if is_on_floor():	
		if (Input.is_action_pressed("ui_down") and move.x == 0) :
			$AnimatedSprite.animation = "Crouch"
			crouching = true
			
			
		elif Input.is_action_pressed("ui_up"):
			$Jump.play()
			move.y = jumpforce

	else:
		$AnimatedSprite.animation = "Jump"
		$Footstep_grass.stop()
		
	move = move_and_slide(move,UP)


