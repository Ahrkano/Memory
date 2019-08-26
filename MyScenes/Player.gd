extends KinematicBody2D

const UP = Vector2(0,-1)
var move = Vector2()
var crouching = false
var ladder_on = false

export var speedX = 100
export var jumpforce = -300
export var gravity = 9.8

var coins = 0

func CoinGrabbed(value):
	coins += value
	$coin_collected.play()
	
		
func _process(delta):
	move.y += gravity 
	
	$AnimatedSprite.playing = true
	
	if not ladder_on :
		
		if Input.is_action_pressed("ui_right") :
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
			
			
		
# CONFIG UP AND DOWN ACTIONS
	
	if is_on_floor():	
	#	CROUCH
		if (Input.is_action_pressed("ui_down") and move.x == 0) :
			$AnimatedSprite.animation = "Crouch"
			crouching = true
			
	#	JUMP (LEAVING GROUND)		
		elif Input.is_action_pressed("ui_up"):
			move.y = jumpforce

	else:
	#	CLIMB	
		if ladder_on :
			$AnimatedSprite.animation = "Climb"
			gravity = 0
			
			if Input.is_action_pressed("ui_up"):
				move.y = -speedX
			elif Input.is_action_pressed("ui_down"):	
				move.y = speedX
			else:
				move.y = 0
		else:
		#	JUMP (IN AIR)	
			gravity = 9.8
			$AnimatedSprite.animation = "Jump"
			$Footstep_grass.stop()
		
	move = move_and_slide(move,UP)

