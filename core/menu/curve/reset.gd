extends Button

@export var curve : Control
func _pressed():
	curve.mode("add")
	pass