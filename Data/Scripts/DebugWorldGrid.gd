@tool
extends Node2D

var width: int = ProjectSettings.get_setting("display/window/size/viewport_width")
var height: int = ProjectSettings.get_setting("display/window/size/viewport_height")

@export var repeatX = 3
@export var repeatY = 3

func _draw():
	for y in range(repeatY):
		for x in range(repeatX):
			draw_rect(Rect2(width*x, height*y, width, height), Color.GREEN, false)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	queue_redraw()
