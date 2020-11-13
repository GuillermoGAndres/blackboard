extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var touch_pressend = false
var position_touch = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass


# Solo va detectar si es ha usado el touch
func _input(event):
	if event is InputEventScreenDrag or event is InputEventScreenTouch:
		#print("mouse button event at ", event.position)
		#touch_pressend = true
		position_touch = event.position
		#print(touch_pressend)
	else:
		$Timer.stop()
	


func _on_Timer_timeout():
	add_point(position_touch)
	$Timer.start()
	pass # Replace with function body.
