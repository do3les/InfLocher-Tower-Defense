extends Node2D

func _ready():
	#print(ProfileManager.profileData["Metacoins"])
	pass

func _on_buttonLvl1_pressed():
	get_tree().change_scene_to_file("res://levels/level1.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_shop_button_pressed():
	get_tree().change_scene_to_file("res://Profiles/metaProgress/MetaShop.tscn")


func _on_level_2_button_pressed():
	get_tree().change_scene_to_file("res://levels/level2.tscn")


func _on_level_3_button_pressed():
	get_tree().change_scene_to_file("res://levels/level3.tscn")
