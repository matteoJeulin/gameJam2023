extends Area2D
 
var accel = 6000
const Types = preload("res://Scripts/Test_types.gd")
var type = Types.red.new()
var direction = 1
var directions = ["down", "right","up", "left"]

func _ready() :
	get_node("../Switch_Arrow_Red_Antitrigo").connect("switch_" + type.color + "_antitrigo", switch_antitrigo)
	get_node("../Switch_Arrow_Red_Trigo").connect("switch_" + type.color + "_trigo", switch_trigo)
	$Sprite2D.texture = load("res://assets/sprites/arrows/arrow_" + directions[direction] + "_" + type.color + "_" + str(randi_range(1,4)) +".png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass

func switch_antitrigo() :
	direction = (direction - 1) % 4
	$Sprite2D.texture = load("res://assets/sprites/arrows/arrow_" + directions[direction] + "_" + type.color + "_" + str(randi_range(1,4)) +".png")

func switch_trigo() :
	direction = (direction + 1) % 4
	$Sprite2D.texture = load("res://assets/sprites/arrows/arrow_" + directions[direction] + "_" + type.color + "_" + str(randi_range(1,4)) +".png")

func _on_body_entered(body):
	if body.name == "Player" :
		if directions[direction] == "down" :
			body.velocity = Vector2.ZERO
			body.velocity.y = accel
		if directions[direction] == "up" :
			body.velocity = Vector2.ZERO
			body.velocity.y = -accel
		if directions[direction] == "right" :
			body.velocity = Vector2.ZERO
			body.velocity.x = accel
		if directions[direction] == "left" :
			body.velocity = Vector2.ZERO
			body.velocity.x = -accel
