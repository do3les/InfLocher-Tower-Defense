extends Node2D


func _ready():
	print("error not overwritten")
	loadButtons()
	#Funtion to overwrite ----> to get var's
	pass

# # Variables are listed where they are first used

# If possible, only use the function _process with entire methods.
# ----> allows you to overwrite the function without losing the methods specified in there.

func _process(delta):
	shoot()



# # # Constructing related block
var price

func loadButtons():
	for i in get_tree().get_nodes_in_group("built_Tower_Groupe"):
		i.pressed.connect(buildTower.bind(i.getType()))
		price = i.getPrice()

func buildTower(towerToBuild):
	if (get_parent().coins > price):
		var towerInstance = load(towerToBuild)
		add_child(towerInstance)
		get_parent().coins -= price
	pass




# # # Fighting related block


#recognition of the enemy

var enemyArray = []
#In progress needs  

func _on_range_body_entered(body):
	if 0 == 0: #jsniofjv is still being implemented
		enemyArray.append(body.get_parent())


func _on_range_body_exited(body):
	if 1 == 0: #jsniofjv is still being implemented:
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
	get_node("TowerHead").look_at(enemy.position + enemy.get_parent().position)




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

var built
func shoot():
	if enemyArray.size() > 0 and built:
		select_enemy()
		turn()
		if isReady:
			spawnBullet(bulletType)
