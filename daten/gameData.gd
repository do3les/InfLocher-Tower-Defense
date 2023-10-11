extends Node


var towerStats = {
	"BasicTower":{
		"fireRate": 1,
		"damge": 10,
		"range": 300,
		"bulletType": "basicBullet",
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
		"number":10,
		"wait":0.1,
		"start_coins":100
	}
}

