extends RigidBody2D

@onready var visibleNotifier = $VisibleOnScreenNotifier2D

func _ready():
	print("Food instantiated")
	visibleNotifier.connect("screen_exited", _on_screen_exited)

func fire(force):
	apply_impulse(force)

func _on_screen_exited():
	queue_free()
