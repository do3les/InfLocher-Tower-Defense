extends Button
@export var tower: PackedScene

@export var price = 50


func _ready():
	self.connect("pressed", build_tower)


func build_tower():
		if (get_node("/root/Level").coins >= price):
			var tower_instance = tower.instantiate()
			get_node("/root/Level/Towers").add_child(tower_instance)
			get_node("/root/Level").coins -= price
