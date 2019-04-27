extends KinematicBody2D

var movedir = Vector2()
export var SPEED = int()

func _ready():
	pass # Replace with function body.

#warning-ignore:unused_argument
func _process(delta):
	if(Input.is_action_just_pressed("mouse_left")):
		sword()
	if(Input.is_action_just_pressed("mouse_right")):
		gun()
	if(Input.is_action_just_pressed("ui_select")):
		dash()
	motion_loop()
	$AnimatedSprite.play(animation())

func motion_loop():
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(left) + int(right)
	movedir.y = -int(up) + int(down)
#warning-ignore:return_value_discarded
	move_and_slide(movedir * SPEED)

func animation():
	var animation = String()
	var view = get_global_mouse_position() - position
	if(abs(view.x) < abs(view.y)):
		if(view.y > 0):
			animation = "down"
		else:
			animation = "up"
	else:
		if(view.x > 0):
			animation = "right"
		else:
			animation = "left"
	return(animation)

func sword():
	$Sword.set_monitoring(true)
	var view = get_global_mouse_position() - position
	if(abs(view.x) < abs(view.y)):
		if(view.y > 0):
			$Sword.position = Vector2(0, 35)
		else:
			$Sword.position = Vector2(0, -35)
	else:
		if(view.x > 0):
			$Sword.position = Vector2(35, 0)
		else:
			$Sword.position = Vector2(-35, 0)
	var monsters = $Sword.get_overlapping_bodies()
#	Modifier ce passage pour tuer les monstres
	for i in monsters :
		i.test()
	$Sword.set_monitoring(false)

func gun():
	$Gun.set_cast_to(get_global_mouse_position()-position)
	var mob = $Gun.get_collider()
	if(mob != null):
		mob.test()
	else:
		print("no mob")

func dash():
	pass

func test():
	print("it works")