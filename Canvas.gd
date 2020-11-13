extends Node2D

func _ready():
	pass
func _input(event):
	if !(event is InputEventScreenDrag or event is InputEventScreenTouch):
		var pencil = preload("res://Pencil.tscn").instance()
		add_child(pencil)
		pass
	pass
