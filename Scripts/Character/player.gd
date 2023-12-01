extends CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	player_movement(delta)
	


func player_movement(delta) :
	#print(_on_body_entered(body))
	if Input.is_action_pressed("right") :
		global_position.x += 10
		$Sprite.texture=load("res://assets/sprites/player_right.png")
	if Input.is_action_pressed("left") :
		global_position.x -= 10
		$Sprite.texture=load("res://assets/sprites/player_left.png")
	if Input.is_action_pressed("up") :
		$Sprite.texture=load("res://assets/sprites/player_up.png")
		global_position.y -= 10
	if Input.is_action_pressed("down") :
		$Sprite.texture=load("res://assets/sprites/player_down.png")
		global_position.y += 10
	
	if velocity.length() > 50000 * delta :
		velocity -= velocity.normalized() * 50000 * delta
	else :
		velocity = Vector2.ZERO
	move_and_slide()



func _on_pause_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Pause.tscn")
