extends "res://towers/Tower.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("overwritten")
	built = false
	declareTowerStats("shooter")
	print("done")

func _process(delta):
	if not built:
		self.position = get_viewport().get_mouse_position()
	else:
		shoot()
