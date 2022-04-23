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
	var coloresAceptados = [[0.066667,0.027451,1,1], [0.039216,0.196078,1,1], [0.039216,0.360784,1,1], [0.043137,0.509804,1,1], [0.039216,0.65098,1,1], [0.019608,0.803922,1,1], [0.05098,1,1,1], [0.039216,1,0.811765,1], [0.023529,1,0.635294,1], [0.015686,1,0.435294,1], [0.035294,1,0.329412,1], [0.035294,1,0.180392,1], [0.054902,1,0.094118,1], [0.156863,1,0.047059,1], [0.286275,1,0.054902,1], [0.458824,1,0.043137,1], [0.603922,1,0.027451,1], [0.737255,1,0.047059,1], [0.870588,1,0.043137,1], [1,0.960784,0.066667,1], [1,0.807843,0.070588,1], [1,0.639216,0.05098,1], [1,0.458824,0.047059,1], [1,0.317647,0.039216,1], [1,0.152941,0.043137,1], [1,0.043137,0.101961,1], [1,0.054902,0.301961,1], [1,0.078431,0.509804,1], [1,0.082353,0.698039,1], [1,0.054902,0.937255,1], [0.843137,0.047059,1,1], [0.611765,0.031373,1,1]]
	var escenaPrincipal=get_tree().get_root().find_node("EscenaPrincipal", true, false)
	
	#captura señal de escena principal
	escenaPrincipal.connect("seleccionaColor", self, "_recibeColor")
	
	#selecciona forma al azars
	var indiceImagen=int(rand_range(0,2))
	get_node("Sprite").texture=images[indiceImagen]
	#pone color al azars
	#var newColor=Color(rand_range(0,1), rand_range(0,1),rand_range(0,1),1)
	var rand_index = rand_range(0, coloresAceptados.size())
	var newColor = Color(coloresAceptados[rand_index][0], coloresAceptados[rand_index][1], coloresAceptados[rand_index][2], coloresAceptados[rand_index][3])

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
