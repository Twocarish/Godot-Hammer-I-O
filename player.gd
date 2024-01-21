extends CharacterBody2D

#@onready var cursorline = $cursorline

var speed = 400
var mouse_sensitivity = 0.001
var footprint_timer = 0
var foot_down = 0

var selected_interactable : Object

func _ready():
	return

func _physics_process(delta):
	velocity = lerp(velocity, Input.get_vector("left", "right", "up", "down").rotated(rotation) * speed, 0.15)
	move_and_slide()
	if velocity != Vector2(0,0):
		footprint_timer += abs(velocity.x)
		footprint_timer += abs(velocity.y)
		if footprint_timer > 10000:
			if foot_down == 0:
				$"../player_footprintpath".add_point(position)
				footprint_timer = 0
				foot_down = 1
			else:
				$"../player_footprintpath".add_point(Vector2(position.x + 5, position.y))
				footprint_timer = 0
				foot_down = 0

func _input(event):
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED: 
		if event.is_action_pressed("interact"):
			if selected_interactable != null:
				selected_interactable.on_player_interact()
		if event.is_action_pressed("click"):
			return
		if event.is_action_pressed("run"):
			speed = 650
		if event.is_action_released("run"):
			speed = 400
		if event is InputEventMouseMotion:
			rotate(event.relative.x * mouse_sensitivity)
#	if event.is_action_pressed("left") or event.is_action_pressed("right") or event.is_action_pressed("up") or event.is_action_pressed("down"):
#		footprint_timer += 0.1
#		print(footprint_timer)
#		if footprint_timer == 1:
#			$"../player_footprintpath".add_point(position)
#		elif event.is_action_pressed("scroll_up"):
#			scroll(1)
#		elif event.is_action_pressed("scroll_down"):
#			scroll(-1)

func inside_interactable(touching_type, interactable):
	print(touching_type)
	if touching_type == 2:
		$buttonprompt.set_visible(true)
	else:
		$buttonprompt.set_visible(false)
	selected_interactable = interactable

#func toggle_interacthint_visibility():
#	$buttonprompt.set_visible(!$buttonprompt.is_visible())
#	print("toggle")

#func scroll(scroll):
#	selection += scroll
#	if selection >= weaponbelt.size():
#		selection = 0
#	if selection <= -1:
#		selection = weaponbelt.size() - 1
#	weapon = weaponbelt[selection]
#
#func zoom(target):
#	if target.y - position.y < 0:
#		target.y -= 192
#	else:
#		target.y += 192
#	if target.x - position.x < 0:
#		target.x -= 192
#	else:
#		target.x += 192
#	var zoomto = Vector2(abs(1 / ((target.x - position.x) / 960)), abs(1 / (((target.y - position.y)) / 540)))
#	if zoomto.y > 0.25 and zoomto.y < 1 and zoomto.y < zoomto.x:
#		$Camera2D.zoom = Vector2( zoomto.y,  zoomto.y)
#	if zoomto.x > 0.25 and zoomto.x < 1 and zoomto.x < zoomto.y:
#		$Camera2D.zoom = Vector2( zoomto.x, zoomto.x)
