extends CharacterBody2D

var richtung = Vector2(1,1)

func _physics_process(delta):
	velocity = richtung * bulletSpeed
	var hit = move_and_collide(velocity * delta)
	if hit:
		if hit.get_collider().get_parent().has_method("on_hit"):
			hit.get_collider().get_parent().on_hit()
			queue_free()


var bulletDamage
var bulletSpeed
var bulletTravelTime
var bulletPiercing

func passOnBulletStats(dmg, speed, trti, pierc):
	bulletDamage = dmg
	bulletSpeed = speed
	bulletTravelTime = trti
	bulletPiercing = pierc
