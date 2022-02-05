extends KinematicBody2D

var velocidad=300
#export (String, FILE) var file_name = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func _physics_process(delta):
	move_and_slide(Vector2(-velocidad,0))
	


func _on_VisibilityNotifier2D_screen_exited():
	print(name)
	#destruye elemento una vez fuera de la pantalla
	queue_free()
	pass # Replace with function body.
