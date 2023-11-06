extends Node

var enemyArray = []
var enemy
var built = false
var isReady = true
var fireRate
var bullet
var bulletType
# ToDo: Organize


func _ready():
	#Funtion to overwrite ----> to get var's
	pass


func _process(_delta):
	if enemyArray.size() != 0 and built:
		select_enemy()
		turn()
		if isReady:
			shoot(bulletType)
	elif not built:
		self.position = get_viewport().get_mouse_position()
		# ToDo: Make it show the range when not built yet.

func shoot(bulletType):
	isReady = false
	
	var bulletSpawnPoint = get_node("TowerBase").global_position
	var towerHead = get_node("BasicTowerHead/TowerHead").global_position
	bullet = load("res://towers/bullets/" + bulletType + ".tscn").instantiate()
	get_node("Bullets").add_child(bullet)
	
	var richtung = (towerHead - bulletSpawnPoint)
	var winkel = richtung.normalized()
	bullet.richtung = winkel
		
	bullet.set_name(bulletType)
	
	await  get_tree().create_timer(fireRate).timeout
	isReady = true


func _input(event):
	if event is InputEventMouseButton and not built:
		built = true
		self.position = event.position
		if Input.is_key_pressed(KEY_SHIFT):
			pass
			# ToDo: Allow building multiple towers in one go.


func select_enemy():
	enemyArray.sort_custom(custom_enemy_sort_by_progress)
	# Gets Enemy with highest progress.
	enemy = enemyArray[-1]


# Sorts by progress
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
	

