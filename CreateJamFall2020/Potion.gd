extends Node


var EFFECT;


var frog_legs = false
var hot_milk = false
var rose_pedals = false
var black_sand = false
var buffalo_tooth = false
var whiskey = false

func check_mixture():
	if black_sand and buffalo_tooth and frog_legs:
		EFFECT = "ANIMAL"
	elif black_sand and buffalo_tooth and hot_milk:
		EFFECT = "OCTOPUS_TF"
	elif black_sand and buffalo_tooth and rose_pedals:
		EFFECT = "GENDER_SWAP"
	elif frog_legs and hot_milk and rose_pedals:
		EFFECT = "SHAPE_ENHANCEMENT"
	elif frog_legs and hot_milk and black_sand:
		EFFECT = "FROG_TF"
	elif frog_legs and hot_milk and buffalo_tooth:
		EFFECT = "FAT"
	elif black_sand and hot_milk and rose_pedals:
		EFFECT = "ALIEN_PREGNANCY"
	elif frog_legs and rose_pedals and buffalo_tooth:
		EFFECT = "EXPLOSION"
	elif whiskey and rose_pedals and hot_milk:
		EFFECT = "CURE"
	elif whiskey and black_sand and buffalo_tooth:
		EFFECT = "SKELETON_TF"
	elif whiskey and black_sand and rose_pedals:
		EFFECT = "ZOMBIE_TF"
	elif whiskey and frog_legs and hot_milk:
		EFFECT = "THIN"
	else:
		EFFECT = "GOOP"
	pass

func reset_mixture():
	frog_legs = false
	hot_milk = false
	rose_pedals = false
	black_sand = false
	buffalo_tooth = false
	whiskey = false
	pass

