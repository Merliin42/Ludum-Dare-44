extends KinematicBody2D

var movedir = Vector2()
export var SPEED = int()


func _ready():
	pass # Replace with function body.

func _process(delta):
	motion_loop(delta)

func motion_loop(delta):
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(left) + int(right)
	movedir.y = -int(up) + int(down)
	position += movedir * SPEED