extends KinematicBody2D

var movedir = Vector2()
export var SPEED = int()
var monsters = []

func _ready():
	print(name)

#warning-ignore:unused_argument
func _process(delta):
	if(Input.is_action_just_pressed("mouse_left")):
		sword()
	if(Input.is_action_just_pressed("mouse_right")):
		gun()
	if(Input.is_action_just_pressed("ui_select")):
		$Collision.set_monitoring(false)
		dash()
		$Collision.set_monitoring(true)
	if(Input.is_action_just_pressed("ui_accept")):
		bomb()
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
	for mob in monsters :
		mob.test()

func gun():
	$Gun.set_cast_to(get_global_mouse_position()-position)
	$Gun.force_raycast_update()
	var mob = $Gun.get_collider()
	if(mob != null and mob.name != "Map"):
		mob.test()

func dash():
#	var view = get_global_mouse_position() - position
#	if(abs(view.x) < abs(view.y)):
#		if(view.y > 0):
#			movedir.x = 0
#			movedir.y = 1
#		else:
#			movedir.x = 0
#			movedir.y = -1
#	else:
#		if(view.x > 0):
#			movedir.x = 1
#			movedir.y = 0
#		else:
#			movedir.x = -1
#			movedir.y = 0
#	move_and_slide(movedir * (SPEED*3))
	pass
	SPEED*=3
	
	
func bomb():
	pass

func ouch():
	print("ouch")
	
func test():
	print("it works")
