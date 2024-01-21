class_name Output
extends Resource

@export_enum("on_start_touch", "on_end_touch", "on_player_interact") var trigger : String
@export var target : NodePath
@export_enum("queue_free","set_modulate") var output : String
@export var parameters : Array
@export var times_to_fire = -1
@export var delay = 0
