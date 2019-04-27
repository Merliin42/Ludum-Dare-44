extends KinematicBody2D

export var MIN_SPEED = 150
export var MAX_SPEED = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "mobWalk"


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
