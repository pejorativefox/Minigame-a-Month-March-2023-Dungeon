extends Camera2D

var screenWidth: int = ProjectSettings.get_setting("display/window/size/viewport_width")
var screenHeight: int = ProjectSettings.get_setting("display/window/size/viewport_height")

var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"../Player"
	position = Vector2i(0, 0)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var worldPosition = Vector2i(player.position) / Vector2i(screenWidth, screenHeight)
	position = worldPosition * Vector2i(screenWidth, screenHeight)
