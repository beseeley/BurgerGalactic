extends Node2D

signal deliveriesComplete

func _process(_delta):
	if (get_tree().get_nodes_in_group("DeliveryTargets").size() == 0):
		print("You win")
		deliveriesComplete.emit()

