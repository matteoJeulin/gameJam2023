extends Area2D
 
var accel = 4000

func _ready() :
	$Sprite2D.texture = load("res://assets/sprites/arrows/arrow_down_orange_" + str(randi_range(1,4)) +".png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass


func _on_body_entered(body):
	if body.name == "Player" :
		body.velocity = Vector2.ZERO
		body.velocity.y = accel
