extends Node2D


func _on_meta_coin_button_pressed():
	ProfileManager.profileData["Metacoins"] += 100
