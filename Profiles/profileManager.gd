extends Node

var filePath 
var profileIndex = 1
var profileData = {}
var savedOnce = false

func _ready():
	profileData = {
		"Metacoins": 0,
		"Highscore": 0,
	}

func resetProfile():
	profileData = {
		"Metacoins": 0,
		"Highscore": 0,
	}
	save_profile()

func save_profile():
	var file = FileAccess.open(filePath, FileAccess.WRITE)
	file.store_var(profileData)
	file.close()

func first_load(profileIndex):
	if (profileIndex == 1 && savedOnce == false):
		save_profile()
		savedOnce = true

func load_profile():
	first_load(profileIndex)
	var file = FileAccess.open(filePath, FileAccess.READ)
	profileData = file.get_var()
	file.close()

func set_and_Save(name, value):
	profileData[name] = value
	save_profile()
