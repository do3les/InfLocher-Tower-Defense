class_name baseEnemy extends PathFollow2D

const type = "base"
@onready var DNA = get_node("DNA").DNA
@onready var level = get_parent().get_parent()

func _ready():
	pass

func really_ready():
	offset_on_path()
	



'func set_shape(shape):
	var shapefile = load("res://assets/shapes/" + shape +".tres")
	get_node("CharacterBody2D/CollisionShape2D").Shape = shapefile
	get_node("CharacterBody2D/CollisionShape2D/Icon").Polygon = shapefile'
	

func offset_on_path():
	var path_width = get_parent().get_node("PathLine").width * 0.8
	var r = get_node("CharacterBody2D/CollisionPolygon2D").shape.radius # ToDo: Needs to be fixed!!!
	get_child(0).position.y = randf_range((path_width / -2 + r), (path_width / 2 - r))


func _physics_process(delta):
	move_on_path(delta)
	if DNA["health"] <= 0:
		die()

func die():
	queue_free()
	level.score += DNA["score"]
	level.coins += DNA["coins"]

func on_hit(dmg):
	DNA["health"] -= dmg
	

func move_on_path(delta):
	progress += DNA["speed"] * delta
	if progress_ratio == 1:
		reached_target()

func reached_target():
	queue_free()
	level.health -= DNA["damage"]


