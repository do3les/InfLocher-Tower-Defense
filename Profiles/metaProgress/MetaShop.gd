extends Node2D

var dmgUpPrice
var dmgUplabel
var towerCapPrice
var towerCapLabel
var metaCoinChancePrice
var metaCoinChanceLabel

var DevCoinButton

func _ready():
	if GameData.debug == true:
		DevCoinButton = preload("res://Profiles/metaProgress/+MetaCoinButton.tscn").instantiate()
		DevCoinButton.position = Vector2(150, 600)
		get_node(".").add_child(DevCoinButton) 
	dmgUplabel = get_node("DmgUpButton/Label")
	towerCapLabel = get_node("TowerCapButton/Label")
	metaCoinChanceLabel = get_node("MetaCoinChanceButton/Label")

func _process(delta):
	dmgUpPrice = int(pow(2, ProfileManager.profileData["DmgUp"]/3))
	dmgUplabel.text = "Cost:  " + str(dmgUpPrice) + " Metacoins" + " (Cost increas after 3 purchas)"


func _on_back_button_pressed():
	ProfileManager.save_profile()
	get_tree().change_scene_to_file("res://interfaceScenes/menu.tscn")


func _on_dmg_up_button_pressed():
	if ProfileManager.profileData["Metacoins"] >= dmgUpPrice:
		ProfileManager.profileData["Metacoins"] -= dmgUpPrice
		ProfileManager.profileData["DmgUp"] += 1
	ProfileManager.save_profile()
