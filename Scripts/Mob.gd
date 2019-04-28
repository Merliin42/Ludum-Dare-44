extends RigidBody2D

export var SPEED = int()

func _ready():
	pass

func _process(delta):
	GoOnPlayer()

func test():
	get_parent().remove_child(self)

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
	apply_impulse(Vector2(0, 0), direction*SPEED)

func _on_Area2D_body_entered(body):
	if body.get_name() == "Character":
		body.ouch()


func _on_VisibilityNotifier2D_screen_entered():
	SPEED = rand_range(5, 10)
