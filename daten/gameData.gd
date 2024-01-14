extends Node

var debug = false

var towerStats = {
	"shooter":{
		"range": 150,
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
		"color": Color("MAGENTA"),
		"shape": "res://assets/shapes/square.tres",
		#
		"damage": 1,
		#
		"health": 100.0,
		"dmgMods": {},
		"armor": {},
		#
		"speed": 50.0,
		"poise": 100,
		"poiseRecovery": 10,
		"poiseMods": {},
		"stunPoise": -30,
	}
}
# InitialDNA and DNAformats MUST HAVE THE SAME KEYS!!!, or something is bound to crash!!!
const DNAformats = {
	"score": "mod",
	"coins": "mod",
	"color": "color",
	"shape": "shape",
	#
	"damage": "mod",
	#
	"health": "mod",
	"dmgMods": "dict_mult",
	"armor": "dict_vals",
	#
	"speed": "mod",
	"poise": "mod",
	"poiseRecovery": "mod",
	"poiseMods": "dict_mult",
	"stunPoise": "mod",
}


var levels = {
	1:{
		"enemy":"basicEnemy",
		"numberOfEnemies":5,
		"enemyFrequency":10,
		"start_coins":100,
		"gracePeriod": 2.0,
		"waveWait": 5.0
	},
	
	2:{
		"enemy":"basicEnemy",
		"numberOfEnemies":5,
		"enemyFrequency":10,
		"start_coins":100,
		"gracePeriod": 2.0,
		"waveWait": 5.0
	},
	
	3:{
		"enemy":"basicEnemy",
		"numberOfEnemies":5,
		"enemyFrequency":5,
		"start_coins":100,
		"gracePeriod": 1.0,
		"waveWait": 7.5
	}
}


