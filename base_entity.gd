extends Node

@export_category("Outputs")
@export var Outputs : Array [Output]

func Process_Input(received_signal):
	for i in Outputs:
		if received_signal == i.trigger:
			if get_node_or_null(i.target) != null:
				get_node(i.target).call(i.output)
			else:
				print("ERROR: ", str(i.target), " is not a valid target")
