extends Node2D


var upgrades
var upnode
var r1
var r2
var r3
var r4


func _ready():
	upnode = get_node("./..")
	upgrades = upnode.upgrades


func _on_damage_pressed():
	if upgrades > 0 && get_node("/root/Level").coins>20:
		upnode.upgrades -= 1
		upnode.bulletDamage = upnode.bulletDamage * (upnode.damageUp + 2 )/(upnode.damageUp + 1) 
		upnode.damageUp += 1
		get_node("/root/Level").coins-=20
		if upgrades == 4:
			get_node("./../Upgrade4").color = Color("ff0000")
			r4="damage"
		if upgrades == 3:
			get_node("./../Upgrade3").color = Color("ff0000")
			r3="damage"
		if upgrades == 2:
			get_node("./../Upgrade2").color = Color("ff0000")
			r2 ="damage"
		if upgrades == 1:
			get_node("./../Upgrade1").color = Color("ff0000")
			r1="damage"
		upgrades = upnode.upgrades


func _on_attack_speed_pressed():
	if upgrades > 0 && get_node("/root/Level").coins>20:
		upnode.upgrades -= 1
		upnode.towerFireRate = upnode.towerFireRate / (upnode.attackSpeedUp + 1 )*(upnode.attackSpeedUp + 0.5)
		upnode.attackSpeedUp += 1
		get_node("/root/Level").coins-=20
		if upgrades == 4:
			get_node("./../Upgrade4").color = Color("00ff00")
			r4="speed"
		if upgrades == 3:
			get_node("./../Upgrade3").color = Color("00ff00")
			r3 = "speed"
		if upgrades == 2:
			get_node("./../Upgrade2").color = Color("00ff00")
			r2 ="speed"
		if upgrades == 1:
			get_node("./../Upgrade1").color = Color("00ff00")
			r1 = "speed"
		upgrades = upnode.upgrades



func _on_pierce_pressed():
	if upgrades > 0 && get_node("/root/Level").coins>20:
		upnode.upgrades -= 1
		upnode.bulletPiercing += 1
		upnode.pierceUp += 1
		get_node("/root/Level").coins-=20
		if upgrades == 4:
			get_node("./../Upgrade4").color = Color("0000ff")
			r4= "pierce"
		if upgrades == 3:
			get_node("./../Upgrade3").color = Color("0000ff")
			r3="pierce"
		if upgrades == 2:
			get_node("./../Upgrade2").color = Color("0000ff")
			r2="pierce"
		if upgrades == 1:
			get_node("./../Upgrade1").color = Color("0000ff")
			r1="pierce"
		upgrades = upnode.upgrades


func _on_remover_pressed():
	if upgrades<0||upgrades>3:
		pass
	if upgrades==0:
		if r1== "pierce":
			upnode.bulletPiercing -=1
			upnode.pierceUp -= 1
		if r1=="speed":
			upnode.towerFireRate = upnode.towerFireRate * (upnode.attackSpeedUp + 1 )/(upnode.attackSpeedUp + 0.5)
			upnode.attackSpeedUp -= 1
		if r1=="damage":
			upnode.bulletDamage = upnode.bulletDamage / (upnode.damageUp + 2 )*(upnode.damageUp + 1)
			upnode.damageUp -= 1
		get_node("./../Upgrade1").color = Color("3e3e3e")
	if upgrades==1:
		if r2== "pierce":
			upnode.bulletPiercing -=1
			upnode.pierceUp -= 1
		if r2=="speed":
			upnode.towerFireRate = upnode.towerFireRate * (upnode.attackSpeedUp + 1 )/(upnode.attackSpeedUp + 0.5)
			upnode.attackSpeedUp -= 1
		if r2=="damage":
			upnode.bulletDamage = upnode.bulletDamage / (upnode.damageUp + 2 )*(upnode.damageUp + 1)
			upnode.damageUp -= 1
		get_node("./../Upgrade2").color = Color("3e3e3e")
	if upgrades==2:
		if r3== "pierce":
			upnode.bulletPiercing -=1
			upnode.pierceUp -= 1
		if r3=="speed":
			upnode.towerFireRate = upnode.towerFireRate * (upnode.attackSpeedUp + 1 )/(upnode.attackSpeedUp + 0.5)
			upnode.attackSpeedUp -= 1
		if r3=="damage":
			upnode.bulletDamage = upnode.bulletDamage / (upnode.damageUp + 2 )*(upnode.damageUp + 1)
			upnode.damageUp -= 1
		get_node("./../Upgrade3").color = Color("3e3e3e")
	if upgrades==3:
		if r4== "pierce":
			upnode.bulletPiercing -=1
			upnode.pierceUp -= 1
		if r4=="speed":
			upnode.towerFireRate = upnode.towerFireRate * (upnode.attackSpeedUp + 1 )/(upnode.attackSpeedUp + 0.5)
			upnode.attackSpeedUp -= 1
		if r4=="damage":
			upnode.bulletDamage = upnode.bulletDamage / (upnode.damageUp + 2 )*(upnode.damageUp + 1)
			upnode.damageUp -= 1
		get_node("./../Upgrade4").color = Color("3e3e3e")
	upnode.upgrades += 1
	upgrades=upnode.upgrades
