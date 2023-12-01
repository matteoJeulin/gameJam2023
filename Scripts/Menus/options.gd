extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_contrôles_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Controles.tscn")


func _on_son_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Son.tscn")


func _on_retour_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Pause.tscn")
