extends Control

var current_button : Button

@onready var Retour : Button = $Retour
@onready var Bind_Up : Button = $up
@onready var Bind_Down : Button = $down
@onready var Bind_Left : Button = $left
@onready var Bind_Right : Button = $right
@onready var Bind_Action : Button = $action
@onready var Bind_Restart : Button = $restart
@onready var label_up : Label = $Label_up
@onready var label_down : Label = $Label_down
@onready var label_left : Label = $Label_left
@onready var label_right : Label = $Label_right
@onready var label_action : Label = $Label_action
@onready var label_restart : Label = $Label_restart

func _ready():
	# Connect the buttons pressed signal:
	Bind_Up.pressed.connect(_on_button_pressed.bind(Bind_Up))
	Bind_Down.pressed.connect(_on_button_pressed.bind(Bind_Down))
	Bind_Left.pressed.connect(_on_button_pressed.bind(Bind_Left))
	Bind_Right.pressed.connect(_on_button_pressed.bind(Bind_Right))
	Bind_Action.pressed.connect(_on_button_pressed.bind(Bind_Action))	
	Bind_Restart.pressed.connect(_on_button_pressed.bind(Bind_Restart))
	_update_labels() # called to refresh the labels
	
	
# Whenerver a button is pressed, do:
func _on_button_pressed(button: Button):
	if button != Retour:
		current_button = button # assign clicked button to current_button
	
	
func _input(event: InputEvent):
	if !current_button: # return if current_button is null
		return
		
	if event is InputEventKey || event is InputEventMouseButton:
		
		# This part is for deleting duplicate assignments:
		# Add all assigned keys to a dictionary
		var all_ies : Dictionary = {}
		for ia in InputMap.get_actions():
			for iae in InputMap.action_get_events(ia):
				all_ies[iae.as_text()] = ia
		
		# check if the new key is already in the dict.
		# If yes, delete the old one.
		if all_ies.keys().has(event.as_text()):
			InputMap.action_erase_events(all_ies[event.as_text()])
		
		# This part is where the actual remapping occures:
		# Erase the event in the Input map
		InputMap.action_erase_events(current_button.name)
		# And assign the new event to it
		InputMap.action_add_event(current_button.name, event)
		
		# After a key is assigned, set current_button back to null
		current_button = null
		
		_update_labels() # refresh the labels
		
func _update_labels():
	# This is just a quick way to update the labels:
	var eb1 : Array[InputEvent] = InputMap.action_get_events("up")
	if !eb1.is_empty():
		label_up.text = eb1[0].as_text()
	else:
		label_up.text = ""
		
	var eb2 : Array[InputEvent] = InputMap.action_get_events("down")
	if !eb2.is_empty():
		label_down.text = eb2[0].as_text()
	else:
		label_down.text = ""
		
	var eb3 : Array[InputEvent] = InputMap.action_get_events("left")
	if !eb3.is_empty():
		label_left.text = eb3[0].as_text()
	else:
		label_left.text = ""
		
	var eb4 : Array[InputEvent] = InputMap.action_get_events("right")
	if !eb4.is_empty():
		label_right.text = eb4[0].as_text()
	else:
		label_right.text = ""
		
	var eb5 : Array[InputEvent] = InputMap.action_get_events("action")
	if !eb5.is_empty():
		label_action.text = eb5[0].as_text()
	else:
		label_action.text = ""
		
	var eb6 : Array[InputEvent] = InputMap.action_get_events("restart")
	if !eb6.is_empty():
		label_restart.text = eb6[0].as_text()
	else:
		label_restart.text = ""


func _on_retour_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Options.tscn")

