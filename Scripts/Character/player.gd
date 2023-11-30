extends CharacterBody2D

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
		global_position.y -= 10
	if Input.is_action_pressed("ui_down") :
		global_position.y += 10
	
	if velocity.length() > 50000 * delta :
		velocity -= velocity.normalized() * 50000 * delta
	else :
		velocity = Vector2.ZERO
		
	move_and_slide()

func _on_body_entered(body):
	if body.name == "Arrow_Up" :
		return "up"
		
	if body.name == "Arrow_Down" :
		return "down"
	
	if body.name == "Arrow_Left":
		return "left"
		
	if body.name == "Arrow_Right" :
		return "right"
