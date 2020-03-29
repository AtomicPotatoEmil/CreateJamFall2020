extends Node2D

onready var GameState = get_node("/root/GameState")

func _ready():
	if GameState.player_position == "Table":
		$Player.global_position = $TableSpawnPoint.global_position
	$AudioStreamPlayer.play()
	pass

func _physics_process(delta):
	if $Table/RayCast2D.is_colliding() == false:
		$Table/W.hide()
	elif $Table/RayCast2D.is_colliding():
		if $Table/RayCast2D.get_collider().is_in_group("player"):
			$Table/W.show()
	
	if $Table/RayCast2D.is_colliding():
		if $Table/RayCast2D.get_collider().is_in_group("player") and Input.is_action_pressed("W"):
			get_tree().change_scene("res://PotionTable/PotionTable.tscn")
	
	if $Door/RayCast2D.is_colliding() == false:
		$Door/W.hide()
	elif $Door/RayCast2D.is_colliding():
		if $Door/RayCast2D.get_collider().is_in_group("player"):
			GameState.player_position = "MainRoomDoor"
			$Door/W.show()
	
	if $Door/RayCast2D.is_colliding():
		if $Door/RayCast2D.get_collider().is_in_group("player") and Input.is_action_pressed("W"):
			get_tree().change_scene("res://MainRoom/MainRoom.tscn")
	pass
