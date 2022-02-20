extends KinematicBody2D

var h_speed = 200
var v_speed = 0
var selectedColor = Color('ffffff')




const images = [preload("res://assets/triangle.png"),
				preload("res://assets/cuadrado.png")]

const figuras=['Triangulo','Cuadrado']

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	
	var escenaPrincipal=get_tree().get_root().find_node("EscenaPrincipal", true, false)
	#captura señal de escena principal
	escenaPrincipal.connect("seleccionaColor", self, "_recibeColor")
	
	#selecciona forma al azars
	var indiceImagen=int(rand_range(0,2))
	get_node("Sprite").texture=images[indiceImagen]
	#pone color al azars
	var newColor=Color(rand_range(0,1), rand_range(0,1),rand_range(0,1),1)
	#var newColor=Color(0, 0, 1 ,1)

	get_node("Sprite").modulate  = newColor




#funcion que reasigna color de acuerdo a la señal
func _recibeColor(color):
	selectedColor=Color(color)


func _physics_process(delta):

	#verifica color actual del nodo	
	var spriteColor= get_node("Sprite").modulate  
	
	
	var grav = sqrt(pow(selectedColor[0]-spriteColor[0],2) + pow(selectedColor[1]-spriteColor[1],2) + pow(selectedColor[2]-spriteColor[2],2))
	#print(grav)
	var acc = 2.2
	v_speed = v_speed + (sqrt(3) * acc/2 - grav * acc)
	move_and_slide(Vector2(-h_speed, v_speed))
	



func _on_VisibilityNotifier2D_screen_exited():
	#destruye objeto cuando sale de la escena
	queue_free()





func _on_Area2D_body_entered(body):
	print(body.name)
	pass # Replace with function body.
