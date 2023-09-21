extends Node

var enemy_array = []
var built = false

func _physics_process(delta):
	turn()

func _ready():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = GameData.towerStats[self.get_name()]["range"]


func turn():
	var enemyPos


func _on_range_body_entered(body):
	enemy_array.append(body.get_parent())
	print(enemy_array)


func _on_range_body_exited(body):
	enemy_array.append(body.get_parent())
