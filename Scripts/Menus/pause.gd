extends Node2D




func _on_quit_pressed():
	get_tree().quit()


func _on_resume_pressed():
	if VariablesGlobales.GameStarted :
		get_tree().change_scene_to_file("res://Scenes/Niveaux/" + VariablesGlobales.Niveau + ".tscn")
	else :
		get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Options.tscn")

