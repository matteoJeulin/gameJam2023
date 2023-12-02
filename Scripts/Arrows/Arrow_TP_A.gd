extends Area2D
 
var accel = 5000
@onready var tp = get_node(get_path())
@onready var tp_b = get_node("../Arrow_TP_B" + str(str(tp).left(str(tp).length() - 21).right(str(tp).length() - 31)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	print(tp_b.global_position)

func _on_body_entered(body):
	if body.name == "Player" :
		body.global_position = tp_b.global_position
