extends Node

var enemyArray = []
var enemy
var built = true

func _physics_process(delta):
	if enemyArray.size() != 0: #and built:
		selectEnemy()
		turn()
	else:
		enemy = null

func _ready():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = GameData.towerStats[self.get_name()]["range"]

func selectEnemy():
	enemyArray.sort_custom(custom_enemy_sort_by_offset)
	enemy = enemyArray[0]

func custom_enemy_sort_by_offset(a, b):
	if typeof(a) == typeof(b):
		return a.offset < b.offset;  # try flipping this comparison 
	else:  # Check to make sure stuff works
		if typeof(a) == TYPE_STRING:
			return false;
		else:
			return true;


func turn():
	get_node("TowerHead").look_at(enemy.position)
	




func _on_range_body_entered(body):
	enemyArray.append(body.get_parent())
	print(enemyArray)


func _on_range_body_exited(body):
	enemyArray.erase(body.get_parent())
	print(enemyArray)
