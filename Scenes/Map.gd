extends StaticBody2D

export (PackedScene) var Mob


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	mobStart()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func mobStart():
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	mob.position = $MobPath/MobSpawnLocation.position
	# add some randomness to the direction
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
#	mob.set_linear_velocity(Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED), 0).rotated(direction))
	mob.move_and_slide(Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED), 0).rotated(direction))
