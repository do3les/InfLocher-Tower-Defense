extends Button

var tower 
var price

func _ready():
	tower = "res://towers/shooter/Shooter.tscn"
	price = 10

func getType():
	return tower 

func getPrice():
	return price
