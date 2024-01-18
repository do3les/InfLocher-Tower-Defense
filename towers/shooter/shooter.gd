extends "res://towers/Tower.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("overwritten")
	built = false
	towerName = "shooter"
	declare_tower_stats()
	#print("done")
	get_node("/root/Level/HUD").gui_input.connect(_on_background_input)


func _process(_delta):
	if not built:
		self.position = get_viewport().get_mouse_position()
	else:
		shoot()

var shown = false
var scene = load("res://towers/Upgrades/upgrade_ui.tscn")
var ui = scene.instantiate()
var upgrades = 4
var damageUp = 0
var attackSpeedUp = 0
var pierceUp = 0






func _on_button_pressed():
	if shown:
		remove_child(ui)
		shown = false
	else:
		add_child(ui)
		shown = true

func _on_background_input(event):
	print(event)
	if shown and event is InputEventMouseButton:
		remove_child(ui)
		shown = false
