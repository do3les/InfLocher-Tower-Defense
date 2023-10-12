extends CharacterBody2D

var bulletSpeed
var bulletDamage
var bulletTravelTime
var bulletPiercing
var direktion

# Called when the node enters the scene tree for the first time.
func _ready():
	direktion = Vector2(1,1)
	print(self.get_name())
	bulletSpeed = GameData.bulletStats[self.get_name()]["bulletSpeed"]
	bulletDamage = GameData.bulletStats[self.get_name()]["bulletDamage"]
	bulletTravelTime = GameData.bulletStats[self.get_name()]["bulletTravelTime"]
	bulletPiercing = GameData.bulletStats[self.get_name()]["bulletPiercing"]

func direktionFunc(input):
	direktion = input

func _physics_process(delta):
	velocity = direktion * bulletSpeed
	move_and_slide()
