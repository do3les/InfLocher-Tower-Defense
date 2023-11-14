extends CharacterBody2D

var richtung = Vector2(1,1)

func _physics_process(delta):
	if (bulletPiercing < 0):
		queue_free()
	velocity = richtung * bulletSpeed
	var hit = move_and_collide(velocity * delta)


var bulletDamage
var bulletSpeed
var bulletTravelTime
var bulletPiercing

func passOnBulletStats(dmg, speed, trti, pierc):
	bulletDamage = dmg
	bulletSpeed = speed
	bulletTravelTime = trti
	bulletPiercing = pierc

func _on_area_2d_body_entered(body):
	bulletPiercing -= 1
	print(body)
	print("hit")
