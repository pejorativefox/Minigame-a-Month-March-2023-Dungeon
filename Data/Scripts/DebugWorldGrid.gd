@tool
extends Node2D

var screenWidth: int = 448
var screenHeight: int = 256

@export var repeatX: int = 4
@export var repeatY: int = 4

@export var tileX = 16
@export var tileY = 16

func _draw():
	for y in range(repeatY):
		for x in range(repeatX):
			var rect = Rect2(screenWidth*x, screenHeight*y, screenWidth, screenHeight)
			for y1 in range(screenHeight/tileY):
				for x1 in range(screenWidth/tileX):
					var rect2 =  Rect2(rect.position + Vector2(x1 * tileX, y1 * tileY), Vector2(tileX, tileY))
					draw_rect(rect2, Color.from_string("cd683d22", Color.ORANGE), false)
			draw_rect(rect, Color.GREEN, false)

# Called when the node enters the scene tree for the first time.
func _ready():
	queue_redraw()	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
