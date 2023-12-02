extends Area2D

signal switch_orange_trigo

func _on_body_entered(body):
	if body.name == "Player" :
		emit_signal("switch_orange_trigo")
