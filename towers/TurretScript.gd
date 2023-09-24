extends Node

var enemyArray = []
var enemy
var built = false

func _process(delta):
	if enemyArray.size() != 0: #and built:
		selectEnemy()
		turn()
	elif not built:
		enemy = null
		self.position = get_viewport().get_mouse_position()

func _input(event):
	if event is InputEventMouseButton and not built:
		built = true
		self.position = event.position

func _ready():
	self.get_node("Range/CollisionShape2D").get_shape().radius = GameData.towerStats[self.get_name()]["range"]
	# crashes with multiple instances, because two instances don't have the same name, only the first is called BasicTower

func selectEnemy():
	enemyArray.sort_custom(custom_enemy_sort_by_progress)
	enemy = enemyArray[-1]

func custom_enemy_sort_by_progress(a, b):
	if typeof(a) == typeof(b):
		return a.progress < b.progress;  # try flipping this comparison 
	else:  # Check to make sure stuff works
		if typeof(a) == TYPE_STRING:
			return false;
		else:
			return true;


func turn():
	get_node("BasicTowerHead").look_at(enemy.position + enemy.get_parent().position)
	print(str(enemy.position + enemy.get_parent().position))
	print("turn")
	




func _on_range_body_entered(body):
	if built:
		enemyArray.append(body.get_parent())
		print("i")


func _on_range_body_exited(body):
	if built:
		enemyArray.erase(body.get_parent())
		print("o")
