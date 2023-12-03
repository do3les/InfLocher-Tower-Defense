extends Node2D

func _ready():
	ProfileManager.metaCoins = 100
	ProfileManager.save_profile()
