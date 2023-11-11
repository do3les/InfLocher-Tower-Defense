extends Node2D


var building
var enemy
var towerScene
var numberOfEnemies = 0
var enemyFrequency = 0
var kills = 0
var coins = 0
var health = 100


func _ready():
	enemy = load("res://enemy/" + GameData.levels[self.get_name()]["enemy"] + ".tscn")
	# ToDo: Rewrite to allow for multiple enemy classes
	
	preload("res://towers/shooter/Shooter.tscn")
	# ToDo: Move to tower build button
	
	numberOfEnemies = GameData.levels[self.get_name()]["numberOfEnemies"]	
	enemyFrequency = GameData.levels[self.get_name()]["enemyFrequency"]
	coins = GameData.levels[self.get_name()]["start_coins"]
	
	get_node("HUD/StartWaveButton").pressed.connect(start_wave)
	get_node("HUD/ExitLevelButton").pressed.connect(exit_level)
	
	load("res://towers/Tower.gd")
	var spawnen = false
	while spawnen == false:
		spawnen = true
		start_wave()
		await get_tree().create_timer(5.0).timeout
		spawnen = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func start_wave():
	for i in range(numberOfEnemies):
		var enemyInstance = enemy.instantiate()
		get_node("Path").add_child(enemyInstance)
		enemyInstance.reached_target.connect(enemy_reached_target)
		await get_tree().create_timer(1 / enemyFrequency).timeout



func enemy_reached_target():
	health -= 5
	# ToDo: Is this all we do here? This could be moved into the enemy.


func building_tower(buildTower):
	if(coins < 10):
		return
	var towerInstance = load("res://towers/" + buildTower + ".tscn").instantiate()
	get_node("Towers").add_child(towerInstance)
	towerInstance.set_name(buildTower)
	coins -= 10
	# ToDo: Variable Tower price!!!


func exit_level():
	for child in get_children(): child.queue_free()
	get_tree().change_scene_to_file("res://interfaceScenes/menu.tscn")
	self.queue_free()
