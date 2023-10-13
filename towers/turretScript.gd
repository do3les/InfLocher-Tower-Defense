extends Node

var enemyArray = []
var enemy
var built = false
var isReady = true
var fireRate
var bullet
var bulletType

func _process(_delta):
	if enemyArray.size() != 0: #and built:
		select_enemy()
		turn()
		if isReady:
			shoot(bulletType)
	elif not built:
		enemy = null
		self.position = get_viewport().get_mouse_position()

func shoot(bulletType):
	isReady = false 
	var bulletSpawnPoint = get_node("TowerBase").global_position
	var towerHead = get_node("BasicTowerHead/TowerHead").global_position
	bullet = load("res://towers/bullets/" + bulletType + ".tscn").instantiate()
	var direktion = (towerHead - bulletSpawnPoint)
	var winkel = direktion.normalized()
	get_node("Bullets").add_child(bullet)
	bullet.set_name(bulletType)
	bullet.direktionFunc(winkel)
	#print("shoot")
	await  get_tree().create_timer(fireRate).timeout
	isReady = true


func _input(event):
	if event is InputEventMouseButton and not built:
		built = true
		self.position = event.position

func _ready():
	
	self.get_node("Range/CollisionShape2D").get_shape().radius = GameData.towerStats[self.get_name()]["range"]
	fireRate = GameData.towerStats[self.get_name()]["fireRate"]
	bulletType = GameData.towerStats[self.get_name()]["bulletType"]
	# crashes with multiple instances, because two instances don't have the same name, only the first is called BasicTower

func select_enemy():
	enemyArray.sort_custom(custom_enemy_sort_by_progress)
	enemy = enemyArray[-1]

func custom_enemy_sort_by_progress(a, b):
	if typeof(a) == typeof(b):
		return a.progress < b.progress;
	else:
		if typeof(a) == TYPE_STRING:
			return false;
		else:
			return true;


func turn():
	get_node("BasicTowerHead").look_at(enemy.position + enemy.get_parent().position)
	#print(str(enemy.position + enemy.get_parent().position))
	#print("turn")
	

func _on_range_body_entered(body):
	if built && GameData.collisonDetection[body.get_name()]["istGegner"] == "gegner":
		enemyArray.append(body.get_parent())


func _on_range_body_exited(body):
	if built: # && (GameData.collisonDetection[body.get_child(0).get_name()]["istGegner"] == "gegner"):
		enemyArray.erase(body.get_parent())
