extends Node2D
var Enemy = preload ("res://enemigo.tscn")
var lista_c = []


#declara señal
signal seleccionaColor(color)


#establece centrado de pantalla
func _ready():
	OS.set_window_position(
		OS.get_screen_position(OS.get_current_screen()) + 
		OS.get_screen_size()*0.5 - OS.get_window_size()*0.5)
	spawn_Enemy()
	


func color_wheel_selection(coordenadasMouse):
	var image=get_node("ColorWheel").get_texture().get_data()
	image.lock()
	var posicionAbsolutaWheel=get_node("ColorWheel").position
	var pickedColor=image.get_pixel(coordenadasMouse.x-posicionAbsolutaWheel.x,
	coordenadasMouse.y-posicionAbsolutaWheel.y)
	image.unlock()	
	lista_c.append([pickedColor])
	print(lista_c)
	return pickedColor
	


#func _process(delta):
#	pass


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:	
			var pickedColor=color_wheel_selection(event.position)
			get_node("Graviton").modulate=Color(pickedColor)
			#emite señal con color seleccionado
			emit_signal("seleccionaColor",pickedColor)



func spawn_Enemy():
	randomize()
	var Enemy = load ("res://enemigo.tscn")
	var e = Enemy.instance()
	e.position.y= 340
	e.position.x=1250
	e.get_node('Sprite').set_texture(preload('res://assets/triangle.png'))
	add_child(e)



func _on_EnemyTimer_timeout():
	
	spawn_Enemy()
	
	
	
	
	

