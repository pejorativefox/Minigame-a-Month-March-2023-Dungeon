

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	pass

func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_Q:
			get_tree().quit()
