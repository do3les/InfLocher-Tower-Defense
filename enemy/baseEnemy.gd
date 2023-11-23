class_name baseEnemy extends PathFollow2D

@export var enemyType = "base"
@onready var DNA = get_node("DNA").DNA
@onready var originalDNA = get_node("DNA").origin
@onready var level = get_parent().get_parent()

func _ready():
	pass

func really_ready():
	get_node("DNA").apply_plasmids()
	set_shape(DNA["shape"])
	offset_on_path()
	



func set_shape(path_to_shape):
	var points = load(path_to_shape).points
	get_node("CharacterBody2D/CollisionPolygon2D").polygon = points
	get_node("CharacterBody2D/Icon").polygon = points
	get_node("CharacterBody2D/Icon").color = DNA["color"]
	

func offset_on_path():
	var path_width = get_parent().get_node("PathLine").width * 0.8
	var r = get_node("CharacterBody2D/CollisionPolygon2D").polygon[randi() %\
	get_node("CharacterBody2D/CollisionPolygon2D").polygon.size()].length() # I don't think this will work.
	get_child(0).position.y = randf_range((path_width / -2 + r), (path_width / 2 - r))


func _physics_process(delta):
	if DNA["poise"] > 0:
		move_on_path(delta)

	if DNA["poise"] < originalDNA["poise"]:
		DNA["poise"] += DNA["poiseRecovery"] * delta
	if DNA["poise"] > originalDNA["poise"]:
		DNA["poise"] = originalDNA["poise"]
	
	if DNA["health"] <= 0:
		die()

func die():
	queue_free()
	level.score += DNA["score"]
	level.coins += DNA["coins"]

func on_hit(dmg, poise_dmg=-1):
	DNA["health"] -= dmg
	DNA["poise"] -= poise_dmg if poise_dmg != -1 else dmg
	if(DNA["poise"] <= 0):
		DNA["poise"] = DNA["stunPoise"]
	

func move_on_path(delta):
	progress += DNA["speed"] * delta
	if progress_ratio == 1:
		reached_target()

func reached_target():
	level.get_node("EnemyGenePool").add_child(get_node("DNA").get_child(0).duplicate()) # ToDo: Fix!!
	level.health -= DNA["damage"]
	queue_free()


