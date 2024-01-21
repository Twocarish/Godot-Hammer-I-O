extends Node2D

#@onready var player = $player
#@onready var cursor = $player/cursor

func _ready():
	#cursorpos = Vector2(cursor.position.x + player.position.x, cursor.position.y + player.position.y)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED and event.is_action_pressed("click"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#func _process(_delta):
#	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
#		cursor.global_position = get_global_mouse_position()
#	player.zoom(get_global_mouse_position())

func connect_interactable(object):
	object.is_touching.connect($player.inside_interactable)
