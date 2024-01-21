extends "res://base_entity.gd"

@export_category("Parameters")
#@export_flags("detectplayer", "showinteractpopup") var param = 1
@export var show_interact_popup = true
@export var detect_player = true

func _on_body_entered(body):
	Check_Parameters("on_start_touch", body)

func _on_body_exited(body):
	Check_Parameters("on_end_touch", body)

func Check_Parameters(input, body):
	if detect_player and body.name == "player":
		Process_Input(input)
