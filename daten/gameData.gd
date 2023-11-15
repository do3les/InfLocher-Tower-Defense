extends Node


var towerStats = {
	"shooter":{
		"range": 300,
		"fireRate": 1,
		"bulletType": "res://towers/shooter/shooterBullet.tscn",
		"bulletName": "bullet",
		"istGegner": "keinGegner",
		"bullet":
			{
			"bulletDamage": 50.0,
<<<<<<< HEAD
			"bulletSpeed": 1800.0,
=======
			"bulletSpeed": 2000.0,
>>>>>>> 621b9b981ae434e1715c9546f6f37ed71779830a
			"bulletTravelTime": 4.0,
			"bulletPiercing": 0.0,
			}
		}
}


var levels = {
	"Level1":{
		"enemy":"basicEnemy",
		"numberOfEnemies":1,
		"enemyFrequency":10,
		"start_coins":100
	}
	
}

