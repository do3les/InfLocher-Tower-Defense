extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://interfaceScenes/menu.tscn")


func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://interfaceScenes/settings.tscn")


func _on_exit_game_button_pressed():
	get_tree().quit()
