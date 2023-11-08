extends Node2D

var built = true

func _ready():
	print("error not overwritten 1")
	loadButtons()
	#Funtion to overwrite ----> to get var's

# # Variables are listed where they are first used

# If possible, only use the function _process with entire methods.
# ----> allows you to overwrite the function without losing the methods specified in there.

# # # Constructing related block
var price

func loadButtons():
	print("hi")
	for i in get_tree().get_nodes_in_group("built_Tower_Groupe"):
		i.pressed.connect(buildTower.bind(i.get_Type()))
		price = i.getPrice()

func buildTower(towerToBuild):
	if (get_node("/root/Level1").coins >= price):
		var towerInstance = load(towerToBuild).instantiate()
		add_child(towerInstance)
		get_node("/root/Level1").coins -= price

func _input(event):
	if event is InputEventMouseButton and not built:
		built = true
		self.position = event.position


func setTowerRange(number):
	print("ok")
	self.get_node("Range/CollisionShape2D").get_shape().radius = number


# # # Fighting related block


#recognition of the enemy

var enemyArray = []
#In progress needs  

func _on_range_body_entered(body):
	if GameData.collisonDetection[body.get_child(0).get_name()]["istGegner"] == "gegner":
		enemyArray.append(body.get_parent())


func _on_range_body_exited(body):
	if (GameData.collisonDetection[body.get_child(0).get_name()]["istGegner"] == "gegner"):
		enemyArray.erase(body.get_parent())




#targeting the enemy

func custom_enemy_sort_by_progress(a, b):
	if typeof(a) == typeof(b):
		return a.progress < b.progress;
	else:
		if typeof(a) == TYPE_STRING:
			return false;
		else:
			return true;


var enemy

func select_enemy():
	enemyArray.sort_custom(custom_enemy_sort_by_progress)
	enemy = enemyArray[-1]


func turn():
	#get_node("TowerHead").look_at(enemy.position + enemy.get_parent().position)
	pass

var isReady = true
var bullet
#bulletType = path to the bullet that the tower shoots
var bulletType
var fireRate

func spawnBullet(bulletType):
	isReady = false
	
	var bulletSpawnPoint = get_node("TowerBase").global_position
	var towerHead = get_node("TowerHead/GunBarrel").global_position
	var richtung = (towerHead - bulletSpawnPoint)
	var winkel = richtung.normalized()
	
	#pass the attributes to bullet
	bullet = load(bulletType).instantiate()
	get_node("Bullets").add_child(bullet)
	bullet.richtung = winkel
	
	#waiting till ready to shoot agein
	await  get_tree().create_timer(fireRate).timeout
	isReady = true


func shoot():
	if enemyArray.size() > 0 and built:
		select_enemy()
		turn()
		if isReady:
			spawnBullet(bulletType)
