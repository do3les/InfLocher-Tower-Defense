extends Node


var towerStats = {
	"BasicTower":{
		"fireRate": 1,
		"damge": 10,
		"range": 300,
		"bulletType": "basicBullet",
		"fireRate": 1.0,
		"bulletType": "basicBullet",
		"range": 300.0

		}
		}

var bulletStats = {
	"BasicBullet": {
		"bulletDamage": 50.0,
		"bulletSpeed": 2500.0,
		"bulletTravelTime": 4.0,
		"bulletPiercing": 0.0,
		# weitere auflistung eigenschaften wie damage type möglich (vlt. nicht auf der basic bullet)
	}
}

var levels = {
	"Level1":{
		"enemy":"basicEnemy",
		"number":10.0,
		"wait":0.1,
		"start_coins":100.0,
		"health": 100.0,
	}
}

