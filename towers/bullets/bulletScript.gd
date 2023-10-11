extends CharacterBody2D

var bulletSpeed = 1;
var bulletDamage
var bulletTravelTime
var bulletPiercing
var bulletType

# Called when the node enters the scene tree for the first time.
func ready():
	bulletSpeed = GameData.bulletStats[self.get_name()]["bulletSpeed"]
	bulletDamage = GameData.bulletStats[self.get_name()]["bulletDamage"]
	bulletTravelTime = GameData.bulletStats[self.get_name()]["bulletTravelTime"]
	bulletPiercing = GameData.bulletStats[self.get_name()]["bulletPiercing"]

var direktion 

func _physics_process(delta):
	velocity = Vector2(bulletSpeed * delta, 0.0)
	move_and_slide()
	pass


