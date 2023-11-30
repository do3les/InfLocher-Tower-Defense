extends Node2D

var profile;
var savePath

func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://interfaceScenes/menu.tscn")
	print("profile2 selected")
	ProfileManager.filePath = savePath
	if (FileAccess.file_exists(savePath)):
		ProfileManager.load_profile()
	else:
		ProfileManager.save_profile()


func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://interfaceScenes/settings.tscn")


func _on_exit_game_button_pressed():
	get_tree().quit()


func _on_option_button_item_selected(index):
	savePath = "res://Profiles/profile"  + str(index) + ".dat"
	print(savePath)


