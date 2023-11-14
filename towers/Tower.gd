extends Node2D


var built = false

func _ready():
	print("error not overwritten 1")
	#Funtion to overwrite ----> to get var's

func _input(event):
	if event is InputEventMouseButton and not built:
		built = true
		self.position = event.position
# # Variables are listed where they are first used

# If possible, only use the function _process with entire methods.
# ----> allows you to overwrite the function without losing the methods specified in there.






var towerName
var towerRange
var fireRate
var bulletType

var bulletName
var bulletDamage
var bulletSpeed
var bulletTravelTime
var bulletPiercing

func declareTowerStats():
	# general Stats
	towerRange = GameData.towerStats[towerName]["range"]
	setTowerRange(towerRange)
	fireRate = GameData.towerStats[towerName]["fireRate"]
	bulletType = GameData.towerStats[towerName]["bulletType"]
	bulletName = GameData.towerStats[towerName]["bulletName"]
	declareBulletStats()
	

func setTowerRange(tRange):
	self.get_node("Range/CollisionShape2D").get_shape().radius = tRange

func declareBulletStats():
	# Stats of the Bullet declared as variable so damge can be upgraded etc
	bulletDamage = GameData.towerStats[towerName][bulletName]["bulletDamage"]
	bulletSpeed = GameData.towerStats[towerName][bulletName]["bulletSpeed"]
	bulletTravelTime = GameData.towerStats[towerName][bulletName]["bulletTravelTime"]
	bulletPiercing = GameData.towerStats[towerName][bulletName]["bulletPiercing"]

func spawnBullet(bType):
	isReady = false
	
	var bulletSpawnPoint = get_node("TowerBase").global_position
	var towerHead = get_node("TowerHead/GunBarrel").global_position
	var richtung = (towerHead - bulletSpawnPoint)
	var winkel = richtung.normalized()
	#pass the attributes to bullet
	bullet = load(bType).instantiate()
	bullet.richtung = winkel
	bullet.passOnBulletStats(bulletDamage, bulletSpeed, bulletTravelTime, bulletPiercing)
	
	get_node("Bullets").add_child(bullet)
	
	#waiting till ready to shoot agein
	await  get_tree().create_timer(fireRate).timeout
	isReady = true






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





# #targeting the enemy
var enemy

func shoot():
	if enemyArray.size() > 0 and built:
		select_enemy()
		turn()
		if isReady:
			spawnBullet(bulletType)

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
	get_node("TowerHead").look_at(enemy.position + enemy.get_parent().position)

#bulletType = path to the bullet that the tower shoots
var isReady = true
var bullet
