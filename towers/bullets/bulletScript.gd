extends CharacterBody2D

var bulletSpeed
var bulletDamage
var bulletTravelTime
var bulletPiercing
var richtung = Vector2(1,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	bulletSpeed = GameData.bulletStats[self.get_name()]["bulletSpeed"]
	bulletDamage = GameData.bulletStats[self.get_name()]["bulletDamage"]
	bulletTravelTime = GameData.bulletStats[self.get_name()]["bulletTravelTime"]
	bulletPiercing = GameData.bulletStats[self.get_name()]["bulletPiercing"]


func _physics_process(delta):
	velocity = richtung * bulletSpeed
	var hit = move_and_collide(velocity * delta)
	if hit:
		if hit.get_collider().get_parent().has_method("on_hit"):
			hit.get_collider().get_parent().on_hit()
			queue_free()
