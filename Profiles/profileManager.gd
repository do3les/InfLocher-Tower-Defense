extends Node

var filePath 
var profileData = {}

func save_profile():
	save_data()
	var file = FileAccess.open(filePath, FileAccess.WRITE)
	file.store_var(profileData)
	file.close()

func save_data():
	profileData = {
		"metaCoins" : metaCoins,
	}

func load_profile():
	var file = FileAccess.open(filePath, FileAccess.READ)
	profileData = file.get_var()
	file.close()
	unpack_load()


func unpack_load():
	metaCoins = profileData["metaCoins"]

var metaCoins
