extends Node2D


func _physics_process(delta):
	if $Sprite/RayCast2D.is_colliding():
		if $Sprite/RayCast2D.get_collider().is_in_group("dummy") and Input.is_action_just_pressed("ui_left"):
			print("dummy")
	pass
