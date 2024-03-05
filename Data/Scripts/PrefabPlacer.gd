extends Node2D

var cursor:= Vector2i(0, 0)
var prototype: Prefab
var tilemap: TileMap
var tileset: TileSet

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	prototype = Prefab.new()
	prototype.load("res://Data/Prefabs/Basic_no_exit_001.json")
	
	var mousePos = get_global_mouse_position()
	cursor = mousePos / 16

	tilemap = TileMap.new()
	tilemap.modulate = Color(0.3, 0.3, 1.0, 1.0)
	tileset = load("res://Data/Tiles/MainTileset.tres")
	tilemap.tile_set = tileset
	
	add_child(tilemap)
	
	tilemap.clear()
	
	for y in range(prototype.height):
		for x in range(prototype.width):
			var tileOffset = (y * prototype.width) + x
			var currentTile = prototype.data[tileOffset]
			if currentTile == "#":
				tilemap.set_cell(0, Vector2(x,y), 0, Vector2(0, 0), 1)
			if currentTile == "D":
				tilemap.set_cell(0, Vector2(x,y), 0, Vector2(0, 0), 2)
	# poo
	$AnimationPlayer.play("Pulse")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	tilemap.position = cursor * 16

func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		var mPosition = Vector2i(event.position) / 16
		cursor = mPosition - Vector2i(prototype.width/2, prototype.height/2)
	elif event is InputEventKey:
		if event.keycode == KEY_R:
			print_debug("rotate")
