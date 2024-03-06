extends Camera2D

var screenWidth: int = ProjectSettings.get_setting("display/window/size/viewport_width")
var screenHeight: int = ProjectSettings.get_setting("display/window/size/viewport_height")

var screenSize: Vector2i = Vector2i(screenWidth, screenHeight)

var player: CharacterBody2D

var oldGridPosition: Vector2i = Vector2i(0, 0)
var tweenDuration: int = 1000
var tweenTimer: int

func _ready():
	player = $"../Player"
	position = Vector2i(0, 0)
	oldGridPosition = Vector2i(player.position) / screenSize
	

func _process(_delta):
	var currentGridPosition = Vector2i(player.position) / screenSize

	if currentGridPosition != oldGridPosition:
		var moveTween = create_tween()
		var toPosition = currentGridPosition * screenSize
		var propTween = moveTween.tween_property(self, "position", Vector2(toPosition), 0.5)
		oldGridPosition = currentGridPosition
		print_debug("moving:", position, toPosition, moveTween, propTween)

func _timer_timeout():
	print_debug("Timer Timeout")
