extends Area2D

signal switch_yellow_antitrigo

func _on_body_entered(body):
	if body.name == "Player" :
		emit_signal("switch_yellow_antitrigo")
