extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Bomb.get_parent() # brancher sur une méthode de main qui rapatrie la position du personnage
	$Bomb/BombTimer.start()
	

func _on_BombTimer_timeout():
	$Bomb/CollisionShape2D.disabled = false
