extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()


func _on_resume_pressed():
	VariablesGlobales.GameStarted = true
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Options.tscn")

