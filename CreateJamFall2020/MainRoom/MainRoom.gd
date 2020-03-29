extends Node2D


var Dialogue = {
	"RedLady_greetings": "Hello handsome <3",
}



func _ready():
	if GameState.player_position == "MainRoomDoor":
		$Player.position = $DoorSpawnSpot.global_position
	elif GameState.player_position == "Staircase":
		$Player.position = $StairCaseSpawnSpot.global_position
	$AudioStreamPlayer.play()
	pass


func _physics_process(delta):
	if $Staircase/Raycast2D.is_colliding() == false:
		$Staircase/W.hide()
	elif $Staircase/Raycast2D.is_colliding():
		if $Staircase/Raycast2D.get_collider().is_in_group("player"):
			$Staircase/W.show()
	
	if $Staircase/Raycast2D.is_colliding():
		if $Staircase/Raycast2D.get_collider().is_in_group("player") and Input.is_action_just_pressed("W"):
			get_tree().change_scene("res://TopRoom/TopRoom.tscn")
	
	if $Door/RayCast2D.is_colliding() == false:
		$Door/W.hide()
	elif $Door/RayCast2D.is_colliding():
		if $Door/RayCast2D.get_collider().is_in_group("player"):
			GameState.player_position = "Workshop Door"
			$Door/W.show()
	
	if $Door/RayCast2D.is_colliding():
		if $Door/RayCast2D.get_collider().is_in_group("player") and Input.is_action_just_pressed("W"):
			get_tree().change_scene("res://WizardWorksShop/WizardWorkshop.tscn")
	pass
