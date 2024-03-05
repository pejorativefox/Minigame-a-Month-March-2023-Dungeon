extends CharacterBody2D

#exports
@export var speed = 100

var directionVectorMap: Dictionary = {
	"Down":  Vector2( 0, 1),
	"Up":    Vector2( 0,-1),
	"Left":  Vector2(-1, 0),
	"Right": Vector2( 1, 0)
}
var inputQueue: Array = []
var facingVector: Vector2 = Vector2(0, 1)

func checkInputDirection(direction: String):
	if Input.is_action_just_pressed(direction):
		if inputQueue.find(direction) == -1:
			inputQueue.push_front(direction)
		else:
			push_warning(direction, " is already in the input queue")
	if Input.is_action_just_released(direction):
		var queuePos = inputQueue.find(direction)
		if queuePos != -1:
			inputQueue.remove_at(queuePos)
		else:
			push_warning(direction, " is not found in the input queue")


func getDirectionVector(direction: String):
	if directionVectorMap.has(direction):
		return directionVectorMap[direction]
	else:
		push_warning(direction, " is not a valid direction")
		return Vector2(0, 0)

func get_input():
	
	for dir in ["Up", "Down", "Left", "Right"]:
		checkInputDirection(dir)
	
	if inputQueue.size() <= 0:
		velocity = Vector2.ZERO
		return
		
	var direction = getDirectionVector(inputQueue[0])
	velocity = direction.normalized() * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()





