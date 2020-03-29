extends Node2D

onready var GameState = get_node("/root/GameState")
onready var Dialogue = get_node("/root/Dialogue")

func _ready():
	$WalkAway.hide()
	$Next.hide()
	$GivePotion.hide()
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


func _on_Heiress_talk():
	match GameState.Heiress_status:
		"normal":
			GameState.is_talking_to_Heiress = true
			GameState.is_talking = true
			$Dialogue.text = Dialogue.Heiress_Dialogue["greetings"]
			$WalkAway.show()
			if GameState.has_potion == true:
				$GivePotion.show()
		"zombie":
			$Dialogue.text = Dialogue.Heiress_Dialogue["zombie"]
			$WalkAway.show()
		"skeleton":
			$Dialogue.text = Dialogue.Heiress_Dialogue["skeleton"]
			$WalkAway.show()
		"fat":
			$Dialogue.text = Dialogue.Heiress_Dialogue["fat"]
			$WalkAway.show()
		"thin":
			$Dialogue.text = Dialogue.Heiress_Dialogue["thin"]
			$WalkAway.show()
		"hot":
			$Dialogue.text = Dialogue.Heiress_Dialogue["hot"]
			$WalkAway.show()
	pass # Replace with function body.


func _on_Singer_talk():
	match GameState.Singer_status:
		"normal":
			GameState.is_talking_to_Singer= true
			GameState.is_talking = true
			$Dialogue.text = Dialogue.Singer_Dialogue["greetings"]
			$WalkAway.show()
			if GameState.has_potion == true:
				$GivePotion.show()
		"zombie":
			$Dialogue.text = Dialogue.Singer_Dialogue["zombie"]
			$WalkAway.show()
		"skeleton":
			$Dialogue.text = Dialogue.Singer_Dialogue["skeleton"]
			$WalkAway.show()
		"fat":
			$Dialogue.text = Dialogue.Singer_Dialogue["fat"]
			$WalkAway.show()
		"thin":
			$Dialogue.text = Dialogue.Singer_Dialogue["thin"]
			$WalkAway.show()
		"hot":
			$Dialogue.text = Dialogue.Singer_Dialogue["hot"]
			$WalkAway.show()
	pass # Replace with function body.


func _on_DarkBowlerhatGuy_talk():
	match GameState.DarkBowlerhatGuy_status:
		"normal":
			GameState.is_talking_to_DarkBowlerhatGuy = true
			GameState.is_talking = true
			$Dialogue.text = Dialogue.DarkBowlerhatGuy_Dialogue["greetings"]
			$WalkAway.show()
			if GameState.has_potion == true:
				$GivePotion.show()
		"zombie":
			$Dialogue.text = Dialogue.DarkBowlerhatGuy_Dialogue["zombie"]
			$WalkAway.show()
		"skeleton":
			$Dialogue.text = Dialogue.DarkBowlerhatGuy_Dialogue["skeleton"]
			$WalkAway.show()
		"fat":
			$Dialogue.text = Dialogue.DarkBowlerhatGuy_Dialogue["fat"]
			$WalkAway.show()
		"thin":
			$Dialogue.text = Dialogue.DarkBowlerhatGuy_Dialogue["thin"]
			$WalkAway.show()
		"hot":
			$Dialogue.text = Dialogue.DarkBowlerhatGuy_Dialogue["hot"]
			$WalkAway.show()
	pass # Replace with function body.


func _on_WalkAway_pressed():
	GameState.is_talking = false
	$WalkAway.hide()
	$GivePotion.hide()
	$Dialogue.text = ""
	pass # Replace with function body.


func _on_GivePotion_pressed():
	GameState.has_potion = false
	if GameState.is_talking_to_Heiress == true:
		$Dialogue.text = Dialogue.Heiress_Dialogue["Smalltalk"]
		$WalkAway.hide()
		$GivePotion.hide()
		$Next.show()
	if GameState.is_talking_to_DarkBowlerhatGuy == true:
		$Dialogue.text = Dialogue.DarkBowlerhatGuy_Dialogue["Smalltalk"]
		$WalkAway.hide()
		$GivePotion.hide()
		$Next.show()
	if GameState.is_talking_to_LightBowlerhatGuy == true:
		$Next.hide()
		$Dialogue.text = ""
		$WalkAway.hide()
		$GivePotion.hide()
		GameState.is_talking = false
	if GameState.Singer_status == "normal":
		match Potion.EFFECT:
			"ZOMBIE_TF":
				GameState.Singer_status = "zombie"
			"SKELETON_TF":
				GameState.Singer_status = "skeleton"
			"FAT":
				GameState.Singer_status = "fat"
			"THIN":
				GameState.Singer_status = "thin"
			"SHAPE_ENHANCEMENT":
				GameState.Singer_status = "hot"
		$Next.hide()
		$Dialogue.text = ""
		$WalkAway.hide()
		$GivePotion.hide()
	pass # Replace with function body.


func _on_Next_pressed():
	if GameState.Heiress_status == "normal":
		match Potion.EFFECT:
			"ZOMBIE_TF":
				GameState.Heiress_status = "zombie"
			"SKELETON_TF":
				GameState.Heiress_status = "skeleton"
			"FAT":
				GameState.Heiress_status = "fat"
			"THIN":
				GameState.Heiress_status = "thin"
			"SHAPE_ENHANCEMENT":
				GameState.Heiress_status = "hot"
	
	if GameState.DarkBowlerhatGuy_status == "normal":
		match Potion.EFFECT:
			"ZOMBIE_TF":
				GameState.DarkBowlerhatGuy_status = "zombie"
			"SKELETON_TF":
				GameState.DarkBowlerhatGuy_status = "skeleton"
			"FAT":
				GameState.DarkBowlerhatGuy_status = "fat"
			"THIN":
				GameState.DarkBowlerhatGuy_status = "thin"
			"SHAPE_ENHANCEMENT":
				GameState.DarkBowlerhatGuy_status = "hot"
	$Next.hide()
	$Dialogue.text = ""
	GameState.is_talking = false
	pass 
