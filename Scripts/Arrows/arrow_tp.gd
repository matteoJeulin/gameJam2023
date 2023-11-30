extends Area2D
 
var accel = 5000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass


func _on_body_entered(body):
	if body.name == "Player" :
		body.global_position.x = randi_range(-500, 500)
		body.global_position.y = randi_range(-500, 500)
