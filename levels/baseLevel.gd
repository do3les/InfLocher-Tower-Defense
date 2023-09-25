extends Node2D

var health = 100
var enemy
var tower_scene
var number = 0
var wait = 0
var kills = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy = load("res://enemy/" + GameData.levels[self.get_name()]["enemy"] + ".tscn")
	tower_scene = preload("res://towers/BasicTower.tscn")
	number = GameData.levels[self.get_name()]["number"]
	wait = GameData.levels[self.get_name()]["wait"]
	get_node("HUD/btn_start_wave").pressed.connect(start_wave)
	get_node("HUD/btn_build").pressed.connect(build_tower)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	
func build_tower():
	self.add_child(tower_scene.instantiate())
