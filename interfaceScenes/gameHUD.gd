extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	get_node("HealthBar").value = get_parent().health
	get_node("HealthBar/HealthLabel").text = str(int(get_parent().health))
	
	get_node("ScoreLable").text = "Score: " + str(get_parent().score)
	
	get_node("CoinsLabel").text = "Coins: " + str(get_parent().coins)
	
	$MetacoinLabel.text = "Metacoins: " + str(ProfileManager.profileData["Metacoins"])

func _ready():
	if GameData.debug == false:
		get_node("Debug Editors").queue_free()
