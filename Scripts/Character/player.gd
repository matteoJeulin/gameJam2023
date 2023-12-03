extends CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	player_movement(delta)
	$compteur_morts.text = "Nombre de morts = " + str(VariablesGlobales.Nb_morts)

func player_movement(delta) :
	#print(_on_body_entered(body))
	if Input.is_action_pressed("right") :
		global_position.x += 10
		$Sprite.texture=load("res://assets/sprites/player/player_right.png")
	if Input.is_action_pressed("left") :
		global_position.x -= 10
		$Sprite.texture=load("res://assets/sprites/player/player_left.png")
	if Input.is_action_pressed("up") :
		$Sprite.texture=load("res://assets/sprites/player/player_up.png")
		global_position.y -= 10
	if Input.is_action_pressed("down") :
		$Sprite.texture=load("res://assets/sprites/player/player_down.png")
		global_position.y += 10
	if Input.is_action_just_pressed("restart") :
		VariablesGlobales.Nb_morts += 1
		get_tree().change_scene_to_file("res://Scenes/Niveaux/" + VariablesGlobales.Niveau + ".tscn")
	if Input.is_action_just_pressed("controles") :
		get_tree().change_scene_to_file("res://Scenes/Menus/Options.tscn") 
	
	if velocity.length() > 50000 * delta :
		velocity -= velocity.normalized() * 50000 * delta
	else :
		velocity = Vector2.ZERO
	move_and_slide()



func _on_pause_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Options.tscn")


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Scenes/Niveaux/Niveau" + str(VariablesGlobales.Niveau) + ".tscn") 
	VariablesGlobales.Nb_morts += 1
