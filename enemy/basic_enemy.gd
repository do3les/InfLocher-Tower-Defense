extends PathFollow2D

signal reached_target

# Called when the node enters the scene tree for the first time.
func _ready():
	var path_width = get_parent().get_node("line").width * 0.8
	var r = $Body/CollisionShape2D.shape.radius
	$Body.position.y = randf_range((path_width / -2 + r), (path_width / 2 - r))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	progress += 100 * delta
	
	if progress_ratio == 1:
		reached_target.emit()
		queue_free()

