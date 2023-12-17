extends Node2D

var profile;
var savePath

func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://interfaceScenes/menu.tscn")
	print("profile2 selected")
	savePath = "user://profile" + str(ProfileManager.profileIndex) + ".dat"
	print(savePath)
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


func _on_button_pressed():
	ProfileManager.profileIndex = 2 
	ProfileManager.filePath = "user://profile" + str(ProfileManager.profileIndex) + ".dat"
	ProfileManager.resetProfile()
	ProfileManager.profileIndex = 1
