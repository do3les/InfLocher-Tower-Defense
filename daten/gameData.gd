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
			"bulletSpeed": 1800.0,
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

