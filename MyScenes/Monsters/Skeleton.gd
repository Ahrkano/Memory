extends Area2D

var direction            = 1
export var currentSpeed  = 10
onready var center       = position.x
var play = false

func _ready():
	$AnimatedSprite.playing = false
	$AnimatedSprite.animation = "Rise"
	$AnimatedSprite.set_frame(0) 

func walk(delta):
	position.x = position.x + (currentSpeed * delta * direction)

func _process(delta):
	if play:
		if position.x < center-80 or position.x > center+80:
			direction = -direction
			if position.x > center+50 :
				$AnimatedSprite.flip_h = false
			else:
				$AnimatedSprite.flip_h = true

		walk(delta)
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		$AnimatedSprite.playing = true
		yield(get_tree().create_timer(4), "timeout")
		$AnimatedSprite.animation = "Walk"
		play = true


