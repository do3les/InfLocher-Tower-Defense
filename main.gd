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

#satndart profil ist in profilemanager festgelegt
func _on_option_button_item_selected(index):
	ProfileManager.profileIndex = index
	savePath = "user://profile" + str(ProfileManager.profileIndex) + ".dat"
	print(savePath)


