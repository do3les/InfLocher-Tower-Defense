extends "res://towers/Tower.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("overwritten")
	built = false
	print(self)
	range(300)
	fireRate = 1
	print("done")

func _process(delta):
	if not built:
		self.position = get_viewport().get_mouse_position()
	else:
		turn()
		#shoot()
