extends Node2D

onready var Dialogue = get_node("/root/Dialogue")


func _ready():
	if GameState.player_position == "MainRoomDoor":
		$Player.position = $DoorSpawnSpot.global_position
	elif GameState.player_position == "Staircase":
		$Player.position = $StairCaseSpawnSpot.global_position
	$AudioStreamPlayer.play()
	
	$WalkAway.hide()
	$GivePotion.hide()
	$Next.hide()
	
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





func _on_WalkAway_pressed():
	GameState.is_talking = false
	$WalkAway.hide()
	$GivePotion.hide()
	$Dialogue.text = ""
	pass 


func _on_GivePotion_pressed():
	GameState.has_potion = false
	if GameState.is_talking_to_RedLady == true:
		$Dialogue.text = Dialogue.RedLady_Dialogue["Smalltalk"]
		$WalkAway.hide()
		$GivePotion.hide()
		$Next.show()
	if GameState.is_talking_to_LightBowlerhatGuy == true:
		$Next.hide()
		$Dialogue.text = ""
		$WalkAway.hide()
		$GivePotion.hide()
		GameState.is_talking = false
		if GameState.LightBowlerhatGuy_status == "normal":
			match Potion.EFFECT:
				"ZOMBIE_TF":
					GameState.LightBowlerhatGuy_status = "zombie"
				"SKELETON_TF":
					GameState.LightBowlerhatGuy_status = "skeleton"
				"FAT":
					GameState.LightBowlerhatGuy_status = "fat"
				"THIN":
					GameState.LightBowlerhatGuy_status = "thin"
				"SHAPE_ENHANCEMENT":
					GameState.LightBowlerhatGuy_status = "hot"
				"OCTOPUS_TF":
					GameState.LightBowlerhatGuy_status = "octopus"
		
	pass 


func _on_Next_pressed():
	if GameState.RedLady_status == "normal":
		match Potion.EFFECT:
			"ZOMBIE_TF":
				GameState.RedLady_status = "zombie"
			"SKELETON_TF":
				GameState.RedLady_status = "skeleton"
			"FAT":
				GameState.RedLady_status = "fat"
			"THIN":
				GameState.RedLady_status = "thin"
			"SHAPE_ENHANCEMENT":
				GameState.RedLady_status = "hot"
			"OCTOPUS_TF":
				GameState.RedLady_status = "octopus"

	$Next.hide()
	$Dialogue.text = ""
	GameState.is_talking = false
	pass 


func _on_RedLady_talk():
	match GameState.RedLady_status:
		"normal":
			GameState.is_talking_to_RedLady = true
			GameState.is_talking = true
			$Dialogue.text = Dialogue.RedLady_Dialogue["greetings"]
			$WalkAway.show()
			if GameState.has_potion == true:
				$GivePotion.show()
		"zombie":
			$Dialogue.text = Dialogue.RedLady_Dialogue["zombie"]
			$WalkAway.show()
		"skeleton":
			$Dialogue.text = Dialogue.RedLady_Dialogue["skeleton"]
			$WalkAway.show()
		"fat":
			$Dialogue.text = Dialogue.RedLady_Dialogue["fat"]
			$WalkAway.show()
		"thin":
			$Dialogue.text = Dialogue.RedLady_Dialogue["thin"]
			$WalkAway.show()
		"hot":
			$Dialogue.text = Dialogue.RedLady_Dialogue["hot"]
			$WalkAway.show()
		"octopus":
			$Dialogue.text = Dialogue.RedLady_Dialogue["octopus"]
			$WalkAway.show()
	pass 


func _on_LightBowlerhatGuy_talk():
	match GameState.LightBowlerhatGuy_status:
		"normal":
			GameState.is_talking_to_LightBowlerhatGuy = true
			GameState.is_talking = true
			$Dialogue.text = Dialogue.LightBowlerhatGuy_Dialogue["greetings"]
			$WalkAway.show()
			if GameState.has_potion == true:
				$GivePotion.show()
		"zombie":
			$Dialogue.text = Dialogue.RedLady_Dialogue["zombie"]
			$WalkAway.show()
		"skeleton":
			$Dialogue.text = Dialogue.RedLady_Dialogue["skeleton"]
			$WalkAway.show()
		"fat":
			$Dialogue.text = Dialogue.RedLady_Dialogue["fat"]
			$WalkAway.show()
		"thin":
			$Dialogue.text = Dialogue.RedLady_Dialogue["thin"]
			$WalkAway.show()
		"hot":
			$Dialogue.text = Dialogue.RedLady_Dialogue["hot"]
			$WalkAway.show()
		"octopus":
			$Dialogue.text = Dialogue.RedLady_Dialogue["octopus"]
			$WalkAway.show()
		
	pass 
