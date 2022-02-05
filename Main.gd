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




func _on_EnemyTimer_timeout():
		
	var Enemy = load ("res://enemigo.tscn")
	var e = Enemy.instance()
	#posición vertical aleatoria
	e.position.y=round((rand_range(30,700)))
	#posición fuera del cuadro
	e.position.x=1350
	
	#sprite al azar de la lista de arriba
	e.get_node('Sprite').set_texture(images[round(rand_range(0,2))])
	add_child(e)

	
