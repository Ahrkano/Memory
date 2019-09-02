extends Area2D

var direction            = -1
export var currentSpeed  = 10
onready var origin       = position.x
var play = false

func _ready():
	$AnimatedSprite.animation = "Idle"

func _on_Hound_body_entered(body):
	if body.is_in_group("Player"):
		play = true
		$AnimatedSprite.animation = "Walk"

func walk(delta):
	position.x = position.x + (currentSpeed * delta * direction)

func _process(delta):
	if play:
		if position.x < origin-60 or position.x > origin:
			direction = -direction
			if position.x >= origin :
				$AnimatedSprite.flip_h = false
			else:
				$AnimatedSprite.flip_h = true
		walk(delta)
