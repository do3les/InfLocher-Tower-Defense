extends Node2D


var building
var enemy 
var towerScene
var numberOfEnemies = 0
var enemyFrequency = 0
var score = 0
var coins = 0
var health = 100
@export var plasmidsPerEnemy = 2  # ToDo: make random
@export var genePoolSize = 8

func _ready():
	enemy = load("res://enemy/baseEnemy.tscn")
	# ToDo: Rewrite to allow for multiple enemy classes
	
	numberOfEnemies = GameData.levels[self.get_name()]["numberOfEnemies"]	
	enemyFrequency = GameData.levels[self.get_name()]["enemyFrequency"]
	coins = GameData.levels[self.get_name()]["start_coins"]
	
	get_node("HUD/StartWaveButton").pressed.connect(start_wave)
	get_node("HUD/ExitLevelButton").pressed.connect(exit_level)
	
	load("res://towers/Tower.gd")
	var spawnen = false
	await get_tree().create_timer(2.0).timeout
	while spawnen == false:
		spawnen = true
		start_wave()
		await get_tree().create_timer(5.0).timeout
		spawnen = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_node("EnemyGenePool").get_children().size() > genePoolSize:
		get_node("EnemyGenePool").get_child(0).queue_free()

# von hand eingesetzte instace nur zum testen
func start_wave():

	
	for i in range(numberOfEnemies):
		var enemyInstance = enemy.instantiate()
		
		get_node("Path").add_child(enemyInstance)
		
		for plasmid in pick_plasmids(plasmidsPerEnemy):
			enemyInstance.get_node("DNA").add_child(plasmid)
		
		enemyInstance.really_ready()
		
		await get_tree().create_timer(1.0 / enemyFrequency).timeout

func pick_plasmids(n):
	var plasmids = get_node("EnemyGenePool").get_children()
	var out = []
	while out.size() < n:
		var pick = plasmids[randi() % plasmids.size()].duplicate()
		if out.has(pick):
			continue
		else:
			out.append(pick)
	return out




func exit_level():
	get_tree().change_scene_to_file("res://interfaceScenes/menu.tscn")
