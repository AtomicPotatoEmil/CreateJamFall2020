extends Area2D

onready var GameState = get_node("/root/GameState")

signal talk

func _ready():
	$AnimatedSprite.play("normal")
	pass

func _physics_process(delta):
	if GameState.LightBowlerhatGuy_status == "normal":
		$AnimatedSprite.play("normal")
	if GameState.LightBowlerhatGuy_status == "zombie":
		$AnimatedSprite.play("zombie")
	if GameState.LightBowlerhatGuy_status == "fat":
		$AnimatedSprite.play("fat")
	if GameState.LightBowlerhatGuy_status == "hot":
		$AnimatedSprite.play("hot")
	if GameState.LightBowlerhatGuy_status == "skinny":
		$AnimatedSprite.play("skinny")
	if GameState.LightBowlerhatGuy_status == "skeleton":
		$AnimatedSprite.play("skeleton")
	if GameState.LightBowlerhatGuy_status == "octopus":
		$AnimatedSprite.play("octopus")
	
	if $RayCast2D.is_colliding() == false:
		$PressSpace.hide()
	elif $RayCast2D.is_colliding():
		if $RayCast2D.get_collider().is_in_group("player") and GameState.is_talking == false: 
			$PressSpace.show()
	
	if $RayCast2D.is_colliding():
		if $RayCast2D.get_collider().is_in_group("player") and Input.is_action_just_pressed("space"):
			GameState.is_talking = true
			emit_signal("talk")
	pass
