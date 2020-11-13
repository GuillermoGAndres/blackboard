extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var flag = false
var evento
var posicion_touch = Vector2(0,0)
var lineas = []
var numLineas = -1
var crearSoloUnaLinea = true
var count = 0
var exitOneLine = false
var indice = -1
var lineaActual
var nuevaLinea

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Soy ready, dibujo la primera linea")
	nuevaLinea = Line2D.new()
	add_child(nuevaLinea)
	lineas.append(nuevaLinea)
	indice += 1
	pass
	
#	var ev = InputEventAction.new()
#	# Set as move_left, pressed.
#	ev.action = "move_left"
#	ev.pressed = true
#	# Feedback.
#	Input.parse_input_event(ev)
#	print(ev)

#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	if Input.is_action_pressed("ui_up"):
		#print("Arriba")
#	var touch = InputEventScreenTouch.new()
#	if touch.is_pressed():
#		print("hola mundo")

#	if flag:
#		print("mouse button event at ", evento.position)

func _draw():
	exitOneLine = false
	var color = Color(0.0,0.0,0.0)
	var radius = 10.0; # Se puede hacer una interfaz que vaya cambiando el radius
	draw_circle(posicion_touch, radius, color)
	
#	var point = PoolVector2Array( [posicion_touch] ) # or just the inner array, necessary if using typed GDScript (3.1)
#	var color2 = PoolColorArray( [Color(0.0, 0.0, 0.0)] ) # same as above
#	draw_primitive(point, color2, PoolVector2Array()) # third argument is UV, disregarded here, used to map textur
#
	print("Ya paso ready ahora me toca dibujarme")
	lineas[indice].width = 5.0 # Ancho del pincel, default 10
	lineas[indice].add_point(posicion_touch)
	print("Puntos: ", lineas[indice].get_point_count() )
	
	#$Line2D.add_point(posicion_touch)
	#print("Puntos:",$Line2D.get_point_count())
	
	#void draw_circle ( Vector2 position, float radius, Color color )
	#lineas[numLineas].add_point(posicion_touch)
	#Termino de dibujar
	#crearSoloUnaLinea = true
	pass

func _process(delta):
	#Quiero actualizar primero laposisiont
#	update() # Va a llamar a la funcion draw
	#print("Flujo programa")
	count += 1*delta
	print(count)
	# Cuando el flujo del programa se vuelve contante significa que
	# ya no hay mas eventos
	# Si pasaron 1s podemos decir que despego el lapiz del papel
	# Y es momento de crear otra linea, pero solamente una, y dejamos 
	# la anterior para que se vea
	if( count > 0.1 and !exitOneLine):
		# crear linea
		print("--------------------------------Despego el lapiz hora de crear otra linea")
		exitOneLine = true
		nuevaLinea = Line2D.new()
		add_child(nuevaLinea)
		lineas.append(nuevaLinea)
		indice += 1
		# Esa linea que sea creo es la ira dibujada
		pass
	
	pass

# Solo es llamada cuando ocurre un evento
func _input(event):
#	if event is InputEventScreenTouch:
##		print("touc")
##		print("mouse button event at ", event.position)
#		flag = true
#		evento = event
	# En el mundo de smartphone si entra es porque a fuerzas
	# el evento sera el touch
	# Lo que tendriamos que hacer es cada vez 
	if event is InputEventScreenDrag : #or event is InputEventScreenTouch
		print("mouse button event at ", event.position)
		posicion_touch = event.position
		update()
#	else: #esto me ayudo darme cuenta que es llamada solamente,cuando hay un evento
#		print("solto", numLineas) 
#		numLineas += 1

	# Esta variable es fundamental, sera nuestro lapso de tiempo que
	# entre cuando suelta el lapiz o no, nos ayuda darnos una idea si es 
	# lleva mucho tiempo con el lapiz y cuando suelta, porque es cuando
	# empieza aumentar count y no se hace cero
	count = 0
	
#	elif event is InputEventMouseButton:
#		print("mouse button event at ", event.position)
#	print(event.as_text())



