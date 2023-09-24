extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = get_parent().get_parent().health
	get_child(0).text = str(value)
