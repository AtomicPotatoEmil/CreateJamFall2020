extends Node2D

func _ready():
	$AudioStreamPlayer.play()
	pass


func _physics_process(delta):
	if $Staircase/RayCast2D.is_colliding() == false:
		$Staircase/W.hide()
	elif $Staircase/RayCast2D.is_colliding():
		if $Staircase/RayCast2D.get_collider().is_in_group("player"):
			GameState.player_position = "Staircase"
			$Staircase/W.show()
	
	if $Staircase/RayCast2D.is_colliding():
		if $Staircase/RayCast2D.get_collider().is_in_group("player") and Input.is_action_just_pressed("W"):
			get_tree().change_scene("res://MainRoom/MainRoom.tscn")
	pass
