extends "res://base_entity.gd"

@export_category("Parameters")
#@export_flags("detectplayer", "showinteractpopup") var param = 1
#I don't know how flags work in godot, will update this down the line when I figure it out. I'm using bools and Check_Parameter() as a crutch in the meantime.
@export var detect_player = true

func _on_body_entered(body):
	Check_Parameters("on_start_touch", body)

func _on_body_exited(body):
	Check_Parameters("on_end_touch", body)

func Check_Parameters(input, body):
	if detect_player and body.name == "player":
		Process_Input(input)
