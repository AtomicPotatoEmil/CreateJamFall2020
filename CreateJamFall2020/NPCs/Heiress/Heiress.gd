extends Area2D

onready var GameState = get_node("/root/GameState")

func _ready():
	$AnimatedSprite.play("normal")
	pass

func _physics_process(delta):
	
	if $RayCast2D.is_colliding() == false:
		$PressSpace.hide()
	elif $RayCast2D.is_colliding():
		if $RayCast2D.get_collider().is_in_group("player") and GameState.is_talking == false: 
			$PressSpace.show()
	pass

