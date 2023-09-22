extends PathFollow2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Body").position.y = randf_range(-20.0, 20.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	progress += 100 * delta
