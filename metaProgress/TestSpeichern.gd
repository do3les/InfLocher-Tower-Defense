extends Node2D

func _ready():
	ProfileManager.metaCoins = 200
	ProfileManager.save_profile()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://interfaceScenes/menu.tscn")
