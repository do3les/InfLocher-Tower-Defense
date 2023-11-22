extends "res://towers/Tower.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("overwritten")
	built = false
	towerName = "shooter"
	declare_tower_stats()
	#print("done")


func _process(_delta):
	if not built:
		self.position = get_viewport().get_mouse_position()
	else:
		shoot()
