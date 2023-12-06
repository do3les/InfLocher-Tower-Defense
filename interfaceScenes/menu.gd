extends Node2D

func _ready():
	print(ProfileManager.metaCoins)

func _on_buttonLvl1_pressed():
	get_tree().change_scene_to_file("res://levels/level1.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_shop_button_pressed():
	get_tree().change_scene_to_file("res://metaProgress/MetaShop.tscn")
