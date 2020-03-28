extends KinematicBody2D

onready var GameState = get_node("/root/GameState")

var GRAVITY = 40
var SPEED = 100
var VELOCITY = Vector2()


func get_input():
	VELOCITY.x = 0
	
	if GameState.is_talking == false:
		if Input.is_action_pressed("right"):
			VELOCITY.x += SPEED
			$AnimatedSprite.play("walk")
			$AnimatedSprite.scale.x = 1
		if Input.is_action_pressed("left"):
			VELOCITY.x -= SPEED
			$AnimatedSprite.play("walk")
			$AnimatedSprite.scale.x = -1
	
	if VELOCITY.x == 0:
		$AnimatedSprite.play("idle")
	

	pass

func _physics_process(delta):
	
	VELOCITY.y += GRAVITY * delta
	get_input()
	VELOCITY = move_and_slide(VELOCITY, Vector2(0, -1))
	pass
