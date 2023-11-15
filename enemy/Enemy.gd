extends PathFollow2D

var level

var enemyName

var enemyHealth
var enemySpeed
var enemyColor
var enemyShape
var enemyScoreValue
var enemyCoinsValue
# vorschlag: color and shape based eigenschaften für die kombination
# bsp gelb = schnell kreis = normal oder viereck = stunned tower beim Tod 
#nur beispiele


func declare_enemy_stats():
	enemyHealth = GameData.enemyStats[enemyName]["enemyHealth"]
	enemySpeed = GameData.enemyStats[enemyName]["enemySpeed"]
	enemyColor = GameData.enemyStats[enemyName]["enemyColor"]
	enemyScoreValue = GameData.enemyStats[enemyName]["enemyScoreValue"]
	enemyCoinsValue = GameData.enemyStats[enemyName]["enemyCoinsValue"]
	verschiebung_auf_pfad()
	level = get_parent().get_parent()


func verschiebung_auf_pfad():
	var path_width = get_parent().get_node("PathLine").width * 0.8
	var r = get_node("CharacterBody2D/CollisionShape2D").shape.radius
	get_child(0).position.y = randf_range((path_width / -2 + r), (path_width / 2 - r))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	enemy_movement(delta)
	enemyDeath()

func enemyDeath():
	if (enemyHealth <= 0):
		queue_free()
		level.score += enemyScoreValue
		level.coins += enemyCoinsValue

func enemy_hit(dmg):
	enemyHealth -= dmg


func enemy_movement(delta):
	progress += enemySpeed * delta
	ende_weg()

func hatEndeWegErreicht():
	if progress_ratio == 1:
		return true

signal reached_target

func ende_weg():
	if (hatEndeWegErreicht() == true):
		queue_free()
		level.score -= enemyScoreValue
		reached_target.emit()
