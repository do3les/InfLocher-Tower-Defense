extends Node2D


var building
var enemy 
var towerScene
var numberOfEnemies = 0
var enemyFrequency = 0
var score = 0
var coins = 0
var health = 100


func _ready():
	# enemy = load("res://enemy/circelEnemys/circleNormal/circleNormal.tscn")
	# ToDo: Rewrite to allow for multiple enemy classes
	
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

# von hand eingesetzte instace nur zum testen
func start_wave():
	for i in range(numberOfEnemies):
		var enemyInstance = enemy.instantiate()
		get_node("Path").add_child(enemyInstance)
		enemyInstance.reached_target.connect(enemy_reached_target)
		await get_tree().create_timer(1.0 / enemyFrequency).timeout



func exit_level():
	for child in get_children(): child.queue_free()
	get_tree().change_scene_to_file("res://interfaceScenes/menu.tscn")
	self.queue_free()
