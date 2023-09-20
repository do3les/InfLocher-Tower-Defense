extends Line2D


# Called when the node enters the scene tree for the first time.
func _ready():
	points = get_parent().curve.get_baked_points()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
