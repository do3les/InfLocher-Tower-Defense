extends CharacterBody2D

var bulletSpeed
var bulletDamage
var bulletTravelTime
var bulletPiercing

# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_name())
	bulletSpeed = GameData.bulletStats[self.get_name()]["bulletSpeed"]
	bulletDamage = GameData.bulletStats[self.get_name()]["bulletDamage"]
	bulletTravelTime = GameData.bulletStats[self.get_name()]["bulletTravelTime"]
	bulletPiercing = GameData.bulletStats[self.get_name()]["bulletPiercing"]

func _physics_process(delta):
	velocity = Vector2(bulletSpeed * delta, 0.0)
	move_and_slide()
