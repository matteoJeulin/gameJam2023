extends Area2D

var taken = false
var directions = ["down", "left", "up", "right"]
@onready var player = get_node("../Player")
@onready var tp = get_node(get_path())
@onready var tp_b = get_node("../Arrow_TP_B" + str(str(tp).left(str(tp).length() - 21).right(str(tp).length() - 31)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass

func _on_body_entered(body):
	if body.name == "Player" and taken == false:
		await animation_up()
		body.global_position = tp_b.global_position
		body.global_position.y = tp_b.global_position.y - 50
		animation_down()
		tp_b.taken = true

func _on_body_exited(body) :
	if body.name == "Player" :
		taken = false

func animation_up() :
	player.can_move = false
	for i in range(15) :
		print(player.global_position.y)
		player.get_child(0).texture=load("res://assets/sprites/player/player_" + directions[i % 4] + ".png")
		player.global_position.y -= 1
		await get_tree().create_timer(0.05).timeout

func animation_down() :
	for i in range(15) :
		print(player.global_position.y)
		player.get_child(0).texture=load("res://assets/sprites/player/player_" + directions[i % 4] + ".png")
		player.global_position.y += 1
		await get_tree().create_timer(0.05).timeout
	player.can_move = true


