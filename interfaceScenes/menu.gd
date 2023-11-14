extends Node2D


func _on_buttonLvl1_pressed():
	get_tree().change_scene_to_file("res://levels/level1.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
