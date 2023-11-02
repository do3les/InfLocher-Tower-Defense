extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	# Set position to end of path curve
	position = get_parent().curve.get_baked_points()[-1] - size / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
