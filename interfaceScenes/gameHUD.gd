extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	get_node("HealthBar").value = get_parent().health
	get_node("HealthBar/HealthLabel").text = str(get_parent().health)
	
	get_node("KillsLabel").text = "Kills: " + str(get_parent().kills)
	
	get_node("CoinsLabel").text = "Coins: " + str(get_parent().coins)
	
	
