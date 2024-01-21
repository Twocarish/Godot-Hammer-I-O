extends "res://base_entity.gd"

@export_category("Parameters")
#@export_flags("detectplayer", "showinteractpopup") var param = 1
@export var show_interact_popup = true
@export var detect_player = true
@export var self_destruct_after_interaction = true

signal is_touching(is_inside, object)

func _ready():
	get_tree().root.get_child(0).connect_interactable(self)

func _on_body_entered(body):
	if show_interact_popup:
		is_touching.emit(2, self)
	else:
		is_touching.emit(1, self)
	Check_Parameters("on_start_touch", body)

func _on_body_exited(body):
	is_touching.emit(0, self)
	Check_Parameters("on_end_touch", body)

func on_player_interact():
	Process_Input("on_player_interact")
	if self_destruct_after_interaction:
		queue_free()

func Check_Parameters(input, body):
	if detect_player and body.name == "player":
		Process_Input(input)
