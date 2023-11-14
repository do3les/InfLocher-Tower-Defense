extends PathFollow2D
# ToDo: Make enemyScript and extend from there
var health = 100

signal reached_target

# Called when the node enters the scene tree for the first time.
func _ready():
	var path_width = get_parent().get_node("PathLine").width * 0.8
	var r = get_node("BasicEnemyC/BasicEnemyC").shape.radius
	get_child(0).position.y = randf_range((path_width / -2 + r), (path_width / 2 - r))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (health < 1):
		queue_free()
	progress += 100 * delta
	if progress_ratio == 1:
		reached_target.emit()
		queue_free()


func on_hit(dmg):
	health -= dmg
	get_parent().get_parent().kills += 1
	get_parent().get_parent().coins += 10
	# ToDo: Allow for variable number of coins

