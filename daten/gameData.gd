extends Node


var towerStats = {
	"shooter":{
		"range": 300,
		"fireRate": 1,
		"bulletType": "res://towers/shooter/bulletShooter.tscn",
		"bulletName": "bullet1",
		"istGegner": "keinGegner",
		"bullet1":
			{
			"bulletDamage": 50.0,
			"bulletSpeed": 2500.0,
			"bulletTravelTime": 4.0,
			"bulletPiercing": 0.0,
			}
		}
}
var collisonDetection = {
	"BasicEnemyC": {
		"istGegner": "gegner",
	},
	"basicBullet": {
		"istGegner": "keinGegner",
	}
}

var bulletStats = {
	"BasicBullet": {
		"istGegner": "keinGegner",
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
		"numberOfEnemies":10,
		"enemyFrequency":10,
		"start_coins":100
	}
	
}

