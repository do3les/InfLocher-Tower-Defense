extends PathFollow2D

var enemyHealth = 100
var enemySpeed
var enemyColor
var enemyShape
# vorschlag: color and shape based eigenschaften für die kombination
# bsp gelb = schnell kreis = normal oder viereck = stunned tower beim Tod 
#nur beispiele

signal reached_target

# Called when the node enters the scene tree for the first time.
func _ready():
	var path_width = get_parent().get_node("PathLine").width * 0.8
	var r = get_node("CharacterBody2D/CollisionShape2D").shape.radius
	get_child(0).position.y = randf_range((path_width / -2 + r), (path_width / 2 - r))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (enemyHealth < 1):
		queue_free()
		get_parent().get_parent().kills += 1
		get_parent().get_parent().coins += 10
	progress += 100 * delta
	if progress_ratio == 1:
		reached_target.emit()
		queue_free()



func enemy_hit(dmg):
	enemyHealth -= dmg
	# ToDo: Allow for variable number of coins
