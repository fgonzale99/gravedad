extends KinematicBody2D

var SPEED=300
export (String, FILE) var file_name = ""
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var newColor=Color(rand_range(0,1), rand_range(0,1),rand_range(0,1),1)
	get_node("Sprite").modulate  = newColor
	
	


	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func _physics_process(delta):
	
	var spriteColor= get_node("Sprite").modulate  
	var selectedColor= Color(get_parent().get_node('CanvasLayer/Label').text)
	
	var li_c = selectedColor.linear_interpolate(spriteColor, 0.5) # Equivalent to Color(0.5, 0.5, 0.0)	
	
	var dd=sqrt(pow(selectedColor[0]-spriteColor[0],2) + pow(selectedColor[1]-spriteColor[1],2) 
	+ pow(selectedColor[2]-spriteColor[2],2))
	
	
	print(dd)
	
	move_and_slide(Vector2(-SPEED,SPEED*(1-dd)*2))
	
	
	
	
	
	
	
	
	


func _on_VisibilityNotifier2D_screen_exited():
	
	queue_free()
	pass # Replace with function body.
