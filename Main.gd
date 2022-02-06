extends Node2D
var Enemy = preload ("res://enemigo.tscn")

const images = [preload("res://assets/enemies/box 1.png"),
				preload("res://assets/enemies/computer 2.png"),
				preload("res://assets/enemies/screen 3.png")]


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			var image=get_node("ColorWheel").get_texture().get_data()
			image.lock()
			var pickedColor=image.get_pixel(event.position.x,event.position.y)
			get_node("CanvasLayer/Label").text=pickedColor.to_html(false)
			get_node("CanvasLayer/Label").set("custom_colors/font_color", pickedColor)
			image.unlock()
			




		

func _on_EnemyTimer_timeout():
	
		
	randomize()
	
	
	var Enemy = load ("res://enemigo.tscn")
	var e = Enemy.instance()
	e.rotation=rand_range(0,360)
	e.position.y=rand_range(200,500)
	e.position.x=1250
	e.get_node('Sprite').set_texture(preload('res://assets/triangle.png'))
	add_child(e)
	
	
