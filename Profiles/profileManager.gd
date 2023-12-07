extends Node

var filePath 
var profileIndex = 1
var profileData = {}
var savedOnce = false

func save_profile():
	save_data()
	var file = FileAccess.open(filePath, FileAccess.WRITE)
	file.store_var(profileData)
	file.close()

func first_load(profileIndex):
	if (profileIndex == 1 && savedOnce == false):
		save_profile()
		savedOnce = true

func save_data():
	profileData = {
		"metaCoins" : metaCoins,
	}

func load_profile():
	first_load(profileIndex)
	var file = FileAccess.open(filePath, FileAccess.READ)
	profileData = file.get_var()
	file.close()
	unpack_load()


func unpack_load():
	metaCoins = profileData["metaCoins"]

var metaCoins
