extends Sprite2D

var vitesse = 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += delta * vitesse
	if position.x == 1980 :
		position.x = -60
	
