extends Node


var towerStats = {
	"shooter":{
		"range": 300,
		"towerFireRate": 1,
		
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

var enemyInitialDNA = {
	"base":{
		"score": 5,
		"coins": 1,
		"color": Color("PINK"),
		"shape": "res://assets/shapes/square.tres",
		
		"damage": 1,
		
		"health": 100.0,
		"dmgMods": {},
		"armor": {},
		
		"speed": 50.0,
		"poise": 100,
		"poiseRecovery": 10,
		"poiseMods": {},
	}
}
# InitialDNA and DNAformats MUST HAVE THE SAME KEYS!!!, or something is bound to crash!!!
const DNAformats = {
	"score": "mod",
	"coins": "mod",
	"color": "color",
	"shape": "shape",
	
	"damage": "mod",
	
	"health": "mod",
	"dmgMods": "dict_mult",
	"armor": "dict_vals",
	
	"speed": "mod",
	"poise": "mod",
	"poiseRecovery": "mod",
	"poiseMods": "dict_mult",
}


var levels = {
	"Level1":{
		"enemy":"basicEnemy",
		"numberOfEnemies":5,
		"enemyFrequency":10,
		"start_coins":100
	}
	
}



