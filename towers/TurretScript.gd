extends Node

var enemyArray = []
var enemy
var built = false

func _physics_process(delta):
	if enemyArray.size() != 0: #and built:
		selectEnemy()
		turn()
	else:
		enemy = null

#func _ready():
#	if built:
#		self.get_node("Range/CollisionShape2D").get_shape().radius = GameData.towerStats[self.get_name()]["range"]

func selectEnemy():
	var progressionEnemyAr = []
	for i in progressionEnemyAr:
		progressionEnemyAr.append(i.offset)
	var furthestEnemy = progressionEnemyAr.max()
	var targetEnemy = progressionEnemyAr.find(furthestEnemy)
	enemy = enemyArray[targetEnemy]


func turn():
	get_node("TowerHead").look_at(enemy.position)
	




func _on_range_body_entered(body):
	enemyArray.append(body.get_parent())
	print(enemyArray)


func _on_range_body_exited(body):
	enemyArray.append(body.get_parent())
