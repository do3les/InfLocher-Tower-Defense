extends Path2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).points = curve.get_baked_points()
	get_child(1).position = curve.get_baked_points()[0] - get_child(1).size / 2
	get_child(2).position = curve.get_baked_points()[-1] - get_child(2).size / 2
	
