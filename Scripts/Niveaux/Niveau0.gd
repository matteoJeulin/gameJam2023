extends Node2D





func _on_button_pressed():
	VariablesGlobales.Niveau = "Niveau1"


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Niveaux/" + VariablesGlobales.Niveau + ".tscn")
