extends Node

@export_category("Outputs")
@export var Outputs : Array [Output]

func Process_Input(received_signal):
	for i in Outputs:
		if i.times_to_fire == 0:
			return
		elif received_signal == i.trigger:
			if get_node_or_null(i.target) != null:
				if i.delay != 0:
					await get_tree().create_timer(i.delay).timeout
				get_node(i.target).callv(i.output, i.parameters)
				i.times_to_fire -= 1
			else:
				print("ERROR: ", str(i.target), " is not a valid target")
