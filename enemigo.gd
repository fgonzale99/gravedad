extends KinematicBody2D

var h_speed = 200
var v_speed = 0

const images = [preload("res://assets/triangle.png"),
				preload("res://assets/cuadrado.png")]

const figuras=['Triangulo','Cuadrado']

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var indiceImagen=int(rand_range(0,2))
	
	
	get_node("Sprite").texture=images[indiceImagen]
	
	
	
	var newColor=Color(rand_range(0,1), rand_range(0,1),rand_range(0,1),1)
	#var newColor=Color(0, 0, 1 ,1)
	get_node("Sprite").modulate  = newColor
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func _physics_process(delta):
	
	var spriteColor= get_node("Sprite").modulate  
	var selectedColor= Color(get_parent().selectedColor)
	var grav = sqrt(pow(selectedColor[0]-spriteColor[0],2) + pow(selectedColor[1]-spriteColor[1],2) + pow(selectedColor[2]-spriteColor[2],2))
	print(grav)
	var acc = 2.2
	v_speed = v_speed + (sqrt(3) * acc/2 - grav * acc)
	move_and_slide(Vector2(-h_speed, v_speed))
	



func _on_VisibilityNotifier2D_screen_exited():
	
	queue_free()
	pass # Replace with function body.
