extends Node2D


onready var GameState = get_node("/root/GameState")
onready var POTION = get_node("/root/Potion")

var interactable = true

var numberOfItemsClicked = 0

func _ready():
	
	GameState.player_position = "Table"
	POTION.EFFECT = "EMPTY"
	if GameState.first_time_potion == true:
		interactable = false
	$PotionBottle/TextureProgress.max_value = 0
	$PotionBottle/TextureProgress.max_value = 3
	$PotionBottle/TextureProgress.value = 0
	
	$AudioStreamPlayer.play()
	pass

func _physics_process(delta):
	
	if numberOfItemsClicked == 3:
		get_tree().change_scene("res://WizardWorksShop/WizardWorkshop.tscn")
	
	print(POTION.EFFECT)
	pass
	
func _on_Milk_pressed():
	if interactable == true:
		POTION.hot_milk = true
		numberOfItemsClicked += 1
		$PotionBottle/TextureProgress.value += 1
		POTION.check_mixture()
	pass 


func _on_Rose_pressed():
	if interactable == true:
		POTION.rose_pedals = true
		numberOfItemsClicked += 1
		$PotionBottle/TextureProgress.value += 1
		POTION.check_mixture()
	pass 


func _on_Whiskey_pressed():
	if interactable == true:
		POTION.whiskey = true
		numberOfItemsClicked += 1
		$PotionBottle/TextureProgress.value += 1
		POTION.check_mixture()
	pass


func _on_BlackSand_pressed():
	if interactable == true:
		POTION.black_sand = true
		numberOfItemsClicked += 1
		$PotionBottle/TextureProgress.value += 1
		POTION.check_mixture()
	pass


func _on_FrogLegs_pressed():
	if interactable == true:
		POTION.frog_legs = true
		numberOfItemsClicked += 1
		$PotionBottle/TextureProgress.value += 1
		POTION.check_mixture()
	pass 


func _on_BuffaloTooth_pressed():
	if interactable == true:
		POTION.buffalo_tooth = true
		numberOfItemsClicked += 1
		$PotionBottle/TextureProgress.value += 1
		POTION.check_mixture()
	pass 

