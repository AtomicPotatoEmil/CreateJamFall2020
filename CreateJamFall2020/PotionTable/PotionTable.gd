extends Node2D


onready var POTION = get_node("/root/Potion")

var numberOfItemsClicked = 0

func _on_Milk_pressed():
	POTION.hot_milk = true
	numberOfItemsClicked += 1
	pass 


func _on_Rose_pressed():
	POTION.rose_pedals = true
	numberOfItemsClicked += 1
	pass 


func _on_Whiskey_pressed():
	POTION.whiskey = true
	numberOfItemsClicked += 1
	pass


func _on_BlackSand_pressed():
	POTION.black_sand = true
	numberOfItemsClicked += 1
	pass
