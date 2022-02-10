extends Node2D
var Enemy = preload ("res://enemigo.tscn")

export (String) var selectedColor = "ffffff"





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
	return pickedColor
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:	
			var pickedColor=color_wheel_selection(event.position)
			selectedColor=pickedColor.to_html(false)
			#get_node("CanvasLayer/Label").text=pickedColor.to_html(false)
			#get_node("CanvasLayer/Label").set("custom_colors/font_color", pickedColor)
			get_node("Graviton").modulate=Color(pickedColor)



func spawn_Enemy():
	randomize()
	var Enemy = load ("res://enemigo.tscn")
	var e = Enemy.instance()
	#e.rotation=rand_range(0,360)
	#e.position.y=rand_range(200,500)
	e.position.y= 340
	e.position.x=1250
	e.get_node('Sprite').set_texture(preload('res://assets/triangle.png'))
	add_child(e)



func _on_EnemyTimer_timeout():
	
	spawn_Enemy()
	
	
	
	
	
