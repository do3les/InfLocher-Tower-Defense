extends Node2D


func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://interfaceScenes/menu.tscn")


func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://interfaceScenes/settings.tscn")


func _on_exit_game_button_pressed():
	get_tree().quit()
