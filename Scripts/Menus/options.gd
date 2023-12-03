extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_son_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Son.tscn")


func _on_controles_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Controles.tscn")


func _on_resume_pressed():
	if VariablesGlobales.GameStarted :
		get_tree().change_scene_to_file("res://Scenes/Niveaux/Niveau" + str(VariablesGlobales.Niveau) + ".tscn")
	else :
		get_tree().change_scene_to_file("res://Scenes/Menus/Startmenu.tscn")


func _on_quit_pressed():
	get_tree().quit()
