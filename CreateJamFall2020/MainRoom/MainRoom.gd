extends Node2D

func _ready():
	$AudioStreamPlayer.play()
	pass


func _physics_process(delta):
	if $Staircase/Raycast2D.is_colliding() == false:
		$Staircase/W.hide()
	elif $Staircase/Raycast2D.is_colliding():
		if $Staircase/Raycast2D.get_collider().is_in_group("player"):
			$Staircase/W.show()
	
	if $Staircase/Raycast2D.is_colliding():
		if $Staircase/Raycast2D.get_collider().is_in_group("player") and Input.is_action_pressed("W"):
			get_tree().change_scene("res://TopRoom/TopRoom.tscn")
	pass
