extends Node2D

#var SceneMenu = preload("res://assets/Menus/")
#var ScenePause = preload(res://assets/Menus/Pause")
#var SceneOption = preload(res://assets/Menus/Option")
#var SceneControles = preload(res://assets/Menus/Controles")
#var SceneSon = preload(res://assets/Menus/Son")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_option_pressed():
	pass # Replace with function body.


func _on_pause_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Pause.tscn")
