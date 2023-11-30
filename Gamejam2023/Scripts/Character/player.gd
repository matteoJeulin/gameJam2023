extends CharacterBody2D


var down = load("res://assets/sprites/player_down.png")
var up = load("res://assets/sprites/player_up.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	player_movement(delta)
	


func player_movement(delta) :
	#print(_on_body_entered(body))
	if Input.is_action_pressed("ui_right") :
		global_position.x += 10
	if Input.is_action_pressed("ui_left") :
		global_position.x -= 10
	if Input.is_action_pressed("ui_up") :
		$Sprite.texture=up
		global_position.y -= 10
	if Input.is_action_pressed("ui_down") :
		$Sprite.texture=down
		global_position.y += 10
	
	if velocity.length() > 50000 * delta :
		velocity -= velocity.normalized() * 50000 * delta
	else :
		velocity = Vector2.ZERO
	move_and_slide()


