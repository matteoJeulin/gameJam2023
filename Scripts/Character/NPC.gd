extends CharacterBody2D

var is_body_in = false
var is_text_shown = false
func _ready() :
	$Texte.hide()

func _process(delta) :
	dialogue()
	#print(is_body_in)



func dialogue() :
	if is_body_in == true :
		if Input.is_key_pressed(KEY_E) and is_text_shown == false :
			is_text_shown = true
			$Texte.show()
			print("aaa")
		if Input.is_key_pressed(KEY_A) and is_text_shown == true :
			is_text_shown = false
			$Texte.hide()
			print("bbb")


func _on_dialogue_body_entered(body):
	if body.name == "Player" :
		is_body_in = true
		is_text_shown = false


func _on_dialogue_body_exited(body):
	print(true)
	if body.name == "Player" :
		is_body_in = false
		$Texte.hide()
