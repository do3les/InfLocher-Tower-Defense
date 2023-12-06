extends Node2D

func _ready():
	ProfileManager.metaCoins = 200
	ProfileManager.save_profile()
