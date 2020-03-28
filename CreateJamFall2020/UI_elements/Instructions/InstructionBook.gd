extends Control

signal set_on_standby
signal resume_from_standby

func _ready():
	$BookOpen.hide()
	$GoBack.hide()
	pass


func _on_TextureButton_pressed():
	$BookOpen.show()
	$ClosedBookBtn.hide()
	$GoBack.show()
	emit_signal("set_on_standby")
	pass 


func _on_GoBack_pressed():
	$BookOpen.hide()
	$GoBack.hide()
	$ClosedBookBtn.show()
	emit_signal("resume_from_standby")
	pass 
