extends Node2D

var health = 100
var enemy
var towerScene
var number = 0
var wait = 0
var kills = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy = load("res://enemy/" + GameData.levels[self.get_name()]["enemy"] + ".tscn")
	towerScene = preload("res://towers/basicTower.tscn")
	number = GameData.levels[self.get_name()]["number"]
	wait = GameData.levels[self.get_name()]["wait"]
	get_node("HUD/StartWaveButton").pressed.connect(start_wave)
	#building buttons
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.pressed.connect(tower_preview.bind(i.name))





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func start_wave():
	for i in range(number):
		var node = enemy.instantiate()
		get_node("Path").add_child(node)
		node.reached_target.connect(enemy_reached_target)
		await get_tree().create_timer(wait).timeout


func enemy_reached_target():
	health -= 5

func enemy_hit(body):
	body.queue_free()
	kills += 1




# Tower bau menü settings etc 
var building
var buildTower


func tower_preview(buildTower):
	var mouse_position = get_global_mouse_position()
	var TowerPreNode = load("res://towers/" + buildTower + ".tscn").instantiate()
	
	get_node("Towers").add_child(TowerPreNode)
	TowerPreNode.set_name("PreviewTower")





#Ende tower bau menü


