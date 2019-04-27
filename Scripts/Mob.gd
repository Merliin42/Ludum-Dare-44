extends KinematicBody2D

export var SPEED = int()

func _process(delta):
	GoOnPlayer()

func test():
	print("ouch the gun")

func GoOnPlayer():
	var direction = get_parent().get_player_pos()-position
	if direction.x > 5 or direction.x < -5:
		direction.x = sign(direction.x)
	else:
		direction.x = 0
	if direction.y > 5 or direction.y < -5:
		direction.y = sign(direction.y)
	else:
		direction.y = 0
#warning-ignore:return_value_discarded
	move_and_slide(direction*SPEED)