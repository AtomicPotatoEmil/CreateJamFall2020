extends Control


func _ready():
	$AudioStreamPlayer.play()
	$CreditScreen.hide()
	$Back.hide()
	pass

func _on_Play_pressed():
	pass 


func _on_Credits_pressed():
	$CreditScreen.show()
	$Back.show()
	pass 


func _on_Back_pressed():
	$CreditScreen.hide()
	$Back.hide()
	pass 
