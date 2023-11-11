extends Button

var tower 
var price

func _ready():
	tower = "res://towers/shooter/Shooter.tscn"
	price = 10

func get_Type():
	return tower 

func getPrice():
	return price
