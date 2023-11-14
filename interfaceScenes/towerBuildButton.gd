extends Button
@export var tower: PackedScene

var price

func _ready():
	price = 10
	self.connect("pressed", build_tower)


func build_tower():
		if (get_node("/root/Level1").coins >= price):
			var tower_instance = tower.instantiate()
			get_node("/root/Level1/Towers").add_child(tower_instance)
			get_node("/root/Level1").coins -= price

