extends Area2D
 
var accel = 5000
@onready var pos = get_node("../arrow_tp_b").global_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass


func _on_body_entered(body):
	if body.name == "Player" :
		body.global_position.x = pos
